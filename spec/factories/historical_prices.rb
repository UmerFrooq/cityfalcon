FactoryBot.define do
  factory :historical_price do
    datetime = Faker::Time.between(from: 365.days.ago, to: DateTime.now, format: :default)
    price_date { datetime.to_date }
    price_hash { [{ close: Faker::Number.number(digits: 3), close_time: datetime }] }    
    
    trait :last_day do
      prices = []
      (0..23).each do |hour|
        (1..59).each do |minute|
          prices << {close: Faker::Number.number(digits: 3), close_time: 1.days.ago.to_datetime.change({hour: hour, min: minute})}
        end
      end
      price_hash { prices }
    end
  end
end