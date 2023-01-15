require 'rails_helper'

RSpec.describe HistoricalPrice, type: :model do
  subject { FactoryBot.build(:historical_price) }
  describe :validations do
    %i[open high low close volume].each do |att|
      it { should validate_presence_of(att.to_sym) }
      it { should validate_numericality_of(att.to_sym) }
    end

    it {should validate_presence_of(:close_date)}
    it { should validate_uniqueness_of(:close_date)}
  end
end
