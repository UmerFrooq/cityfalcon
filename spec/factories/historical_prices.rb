FactoryBot.define do
  factory :historical_price do
    close { Faker::Number.positive }
    volume { Faker::Number.number(digits: 10) }
    close_time { Faker::Time.between(from: 365.days.ago, to: DateTime.now, format: :default) }
  end
end