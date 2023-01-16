class LatestPriceJob
  include Sidekiq::Job
  sidekiq_options queue: :default, :retry => 0

  def perform()
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
    volume = usd_price&.dig(:volume_24h)
    HistoricalPrice.create!(close: current_price, volume: volume, close_time: DateTime.now)
  end

end
