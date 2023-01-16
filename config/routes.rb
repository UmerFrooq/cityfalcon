Rails.application.routes.draw do
  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  mount Sidekiq::Web => '/sidekiq'
  # Defines the root path route ("/")
  get 'historical_prices/index'
  root "historical_prices#index"

  get 'historical_prices/history'
end
