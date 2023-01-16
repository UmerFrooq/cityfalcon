require 'rails_helper'

RSpec.describe "HistoricalPrices", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/historical_prices/index"
      expect(response).to have_http_status(:success)
    end
  end
end
