# frozen_string_literal: true
require 'net/http'

module NetworkHelper
  BASE_URL = ENV["COIN_MARKET_API_URL"]
  API_KEY = ENV["COIN_MARKET_API_KEY"]

  def do_request(type:, endpoint:, **body)
    request_payload, http = initialize_request(type, endpoint, body)
    response = http.request(request_payload)
    JSON.parse(response.body)
  rescue StandardError => e
    if response.present?
      error_text = response.message
      status = response.code
    else
      error_text = "#{e.class}: #{e.message}"
      status = 500
    end

    { error: error_text, status: status }
  end

  private

  def initialize_request(type, endpoint, body)
    
    uri = URI.parse((BASE_URL + endpoint).to_s)
    uri.query = URI.encode_www_form(body.dig(:params)) if body.present?
    request = case type
    when "GET"
      Net::HTTP::Get.new(uri.request_uri)
    else
      raise StandardError.new("Request Type is not correct! ")
    end

    request["Content-Type"] = "application/json"
    request["X-CMC_PRO_API_KEY"] = API_KEY
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    [request, http]
  end
end
