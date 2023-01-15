# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

histoical_prices = []
(1..365).each do |i|
 histoical_prices <<  HistoricalPrice.new(
  open: Faker::Number.positive,
  high: Faker::Number.positive,
  close: Faker::Number.positive,
  low: Faker::Number.positive,
  volume: Faker::Number.number(digits: 10) ,
  close_date:( Date.today - i)
 )
end

HistoricalPrice.import histoical_prices