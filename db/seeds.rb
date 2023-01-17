# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

histoical_prices = []
(0..365).each do |i|
  prices = []
  case i
  when 0
    current_time = DateTime.now
    h = current_time.hour
    m = current_time.minute
    (0..h).each do |hour|
      minute = hour == h ? m : 59
      (1..minute).each do |minute|
        prices << { close: Faker::Number.positive, close_time: i.day.ago.to_datetime.change({hour: hour, min: minute}) }
      end
    end
  when 1
    (0..23).each do |hour|
      (1..59).each do |minute|
        prices << { close: Faker::Number.positive, close_time: i.day.ago.to_datetime.change({hour: hour, min: minute}) }
      end
    end
  else
    prices << { close: Faker::Number.positive, close_time: i.day.ago.to_datetime.change({hour: 23, min: 59}) }
  end
  
  histoical_prices << HistoricalPrice.new(price_date: i.day.ago.to_date, price_hash: prices)
end

HistoricalPrice.import histoical_prices