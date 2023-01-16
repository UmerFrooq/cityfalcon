class HistoricalPricesController < ApplicationController
  before_action :forced_json, only: %i[history]

  def index
    @latest_price = HistoricalPrice.last
  end

  def history
    @prices = HistoricalPrice.where("close_date >= ? AND close_date <= ?", 1.years.ago.to_date, Date.today)

  end

  private

  def forced_json
		request.format = :json
	end
end
