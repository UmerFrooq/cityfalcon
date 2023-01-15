# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CoinMarketManager::CurrentPrice do
  it "should give current price " do
    VCR.use_cassette "btc/current_price" do
      response = CoinMarketManager::CurrentPrice.call("BTC", "USD")
      expect(response.status).to eql(:ok)
    end
  end

  it "should give bad request 400 " do
    VCR.use_cassette "btc/symbol_missing" do
      response = CoinMarketManager::CurrentPrice.call("", "USD")
      byebug
      expect(response.status).to eql("400")
    end
  end
end