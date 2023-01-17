class LatestPriceJob
  include Sidekiq::Job
  sidekiq_options queue: :default, retry: 0

  def perform
    response = CoinMarketManager::CurrentPrice.call('BTC', 'USD')
    if response.valid?
      add_latest_btc_price(response&.data&.with_indifferent_access)
    else
      raise StandardError.new(response&.data.dig(:error))
    end
  end

  def add_latest_btc_price(data)
    usd_price = data&.dig(:data, :BTC, :quote, :USD)
    current_price = usd_price&.dig(:price)
    create_or_update_historical_price(current_price)
  end

  def create_or_update_historical_price(current_price)
    last_price = HistoricalPrice.first
    current_datetime = DateTime.now
    if last_price.price_date == current_datetime.to_date
      price_hash = { close: current_price, close_time: DateTime.now}
      update_recent_historical_price(last_price, price_hash)
    else
      create_new_historical_price(price_hash)
    end
  end

  def update_recent_historical_price(price, price_hash)
    price.price_hash.push(price_hash)
    price.save!
  end

  def create_new_historical_price(price_hash)
    HistoricalPrice.create!(price_date: Date.today, price_hash: price_hash)
  end
end
