class HistoricalPricesController < ApplicationController
  include PricesConcern

  before_action :forced_json, only: %i[history]

  def index
    @latest_price = HistoricalPrice.first
  end

  def history
    render json: fetch_prices(params)
  end

  private

    def forced_json
      request.format = :json
    end
end
