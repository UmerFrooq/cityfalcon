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