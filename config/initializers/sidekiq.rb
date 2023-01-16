require 'sidekiq/web'

Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
  [user, password] == ENV.values_at('SIDEKIQ_MONITOR_HTTP_BASIC_USER', 'SIDEKIQ_MONITOR_HTTP_BASIC_PASSWORD')
end

Sidekiq.configure_server do |config|
  config.on(:startup) do
    schedule_file = "config/schedule.yml"

    if File.exist?(schedule_file)
      Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
    end
  end
end


Sidekiq.configure_server do |config|
  config.redis = {
    url: ENV["SIDEKIQ_REDIS_URL"] || ENV["REDIS_URL"] || "redis://localhost:6379/1",
    ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE }
  }
end

Sidekiq.configure_client do |config|
  config.redis = {
    url: ENV["SIDEKIQ_REDIS_URL"] || ENV["REDIS_URL"] || "redis://localhost:6379/1",
    ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE }
  }
end