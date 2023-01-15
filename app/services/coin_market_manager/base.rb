# frozen_string_literal: true

module CoinMarketManager
  class Base < ApplicationService
    def rescue_from_pricing_api
      yield
    rescue StandardError
      response(@api_response, status: @api_response.dig(:status))
    rescue => e
      response(e, status: :unprocessable_entity)
    end
  end
end