module CloseValueConcern
  extend ActiveSupport::Concern

  def date_and_close_values(historical_prices)
    dates = []
    close_values = [] 
    historical_prices.each do |price|
      last_price = price.price_hash&.last
      dates << last_price.dig("close_time")
      close_values << last_price.dig("close")
    end

    [dates.compact, close_values.compact ]
  end

  def close_value_by_datetime(historical_prices)
    all_day_price_hash = Hash.new
    historical_prices.price_hash.each do |price|
      all_day_price_hash.merge!({price.dig("close_time") => price.dig("close")})
    end

    [all_day_price_hash.keys.compact, all_day_price_hash.values.compact ]
  end

  def close_value_by_last_hour(historical_price)
    current_time = DateTime.now
    previous_hour = current_time.hour - 1

    last_hour_price_hash = Hash.new
    historical_price.price_hash.each do |price|
      close_time = DateTime.parse(price.dig("close_time"))
      if close_time.hour >= previous_hour
        last_hour_price_hash.merge!({close_time => price.dig("close")})
      end
    end

    [last_hour_price_hash.keys.compact, last_hour_price_hash.values.compact ]
  end
end
