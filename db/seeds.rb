# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

histoical_prices = []
(1..365).each do |i|
  histoical_prices << HistoricalPrice.new(
    close: Faker::Number.positive,
    volume: Faker::Number.number(digits: 10),
    close_time: i.day.ago
  )
end

HistoricalPrice.import histoical_prices