FactoryBot.define do
  factory :historical_price do
    open { Faker::Number.positive }
    high { Faker::Number.positive }
    low { Faker::Number.positive }
    close { Faker::Number.positive }
    volume { Faker::Number.number(digits: 10) }
  end
end
