class HistoricalPricesController < ApplicationController
  before_action :forced_json, only: %i[history]

  def index
    @latest_price = HistoricalPrice.last
  end

  def history
    @prices = HistoricalPrice.where("close_time >= ? AND close_time <= ?", 1.years.ago, DateTime.now).order(close_time: :desc)
  end

  private

  def forced_json
		request.format = :json
	end
end
