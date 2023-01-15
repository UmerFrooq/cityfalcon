# frozen_string_literal: true

VCR.configure do |config|
  config.cassette_library_dir = Rails.root.join('spec', 'vcr')
  config.hook_into :webmock
  config.filter_sensitive_data('<COIN_MARKET_API_KEY>') { ENV["COIN_MARKET_API_KEY"] }
end 