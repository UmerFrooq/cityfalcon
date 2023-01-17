require 'rails_helper'

RSpec.describe "HistoricalPrices", type: :request do
  let!(:historical_prices) do
    (1..365).each do |i|
      datetime = i.days.ago
      FactoryBot.create(:historical_price, price_date: datetime.to_date, price_hash: [{close: Faker::Number.number(digits: 3), close_time: datetime.to_datetime.change({hour: 23, min: 59})}])
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/historical_prices/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /history" do
    it "history request with year as paramter" do
      get "/historical_prices/history", params: {type: 'year', from: 1.week.ago.to_date, to: Date.today}

      expect(JSON.parse(response.body)[0].count).to eql(365)
      expect(JSON.parse(response.body)[1].count).to eql(365)
      expect(response).to have_http_status(:success)
    end

    it "history request with month as paramter" do
      get "/historical_prices/history", params: {type: 'month', from: 1.week.ago.to_date, to: Date.today}
      monthly_count = (Date.today - 1.month.ago.to_date).to_i
      expect(JSON.parse(response.body)[0].count).to eql(monthly_count)
      expect(JSON.parse(response.body)[1].count).to eql(monthly_count)
      expect(response).to have_http_status(:success)
    end

    it "history request with week as paramter" do
      get "/historical_prices/history", params: {type: 'week', from: 1.week.ago.to_date, to: Date.today}
      weekly_count = (Date.today - 1.week.ago.to_date).to_i
      expect(JSON.parse(response.body)[0].count).to eql(weekly_count)
      expect(JSON.parse(response.body)[1].count).to eql(weekly_count)
      expect(response).to have_http_status(:success)
    end


    it "history request with one_day as paramter" do
      get "/historical_prices/history", params: {type: 'one_day', from: 1.week.ago.to_date, to: Date.today}
      one_day_price_count = HistoricalPrice.yesterday.price_hash.count
      expect(JSON.parse(response.body)[0].count).to eql(one_day_price_count)
      expect(JSON.parse(response.body)[1].count).to eql(one_day_price_count)
      expect(response).to have_http_status(:success)
    end

    it "history request with by_hour as paramter" do
      get "/historical_prices/history", params: {type: 'by_hour', from: 1.week.ago.to_date, to: Date.today}
      
      expect(response).to have_http_status(:success)
    end

    it "history request with by_date as paramter" do
      get "/historical_prices/history", params: {type: 'by_date', from: 1.week.ago.to_date, to: Date.today}
      day_count = (Date.today - 1.week.ago.to_date).to_i
      expect(JSON.parse(response.body)[0].count).to eql(day_count)
      expect(JSON.parse(response.body)[1].count).to eql(day_count)
      expect(response).to have_http_status(:success)
    end
  end
end
