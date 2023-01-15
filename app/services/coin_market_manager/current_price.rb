# frozen_string_literal: true
include NetworkHelper

module CoinMarketManager
  class CurrentPrice < Base
    attr_reader :symbol, :currency, :api_response

    def initialize(symbol, currency)
      @symbol = symbol
      @currency = currency
      @api_response = nil
    end

    def call
      rescue_from_pricing_api do 
        fetch_current_price
        response(@api_response)
      end
    end

    private 

    def fetch_current_price
      @api_response = do_request(
        type: "GET",
        endpoint: "/quotes/latest",
        params: {
          symbol: symbol,
          convert: currency
        }
      )
      
     raise StandardError.new(api_response.dig(:error)) if api_response.dig(:status) != nil
    end
  end
end