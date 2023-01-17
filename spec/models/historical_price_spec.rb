require 'rails_helper'

RSpec.describe HistoricalPrice, type: :model do
  subject { FactoryBot.build(:historical_price) }
  describe :validations do
    it { should validate_presence_of(:price_date) }
  end
end
