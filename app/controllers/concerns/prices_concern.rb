module PricesConcern
  extend ActiveSupport::Concern

  include CloseValueConcern

  def fetch_prices(params)
    type = params.dig(:type)&.to_sym
    type = type.nil? ? :month : type

    return date_and_close_values(prices_by_type(type, params)) if %i[year month week by_date ].include?(type)
    return close_value_by_datetime(HistoricalPrice.yesterday) if type == :one_day
    return close_value_by_last_hour(HistoricalPrice.first) if type == :by_hour

  end

  def prices_by_type(type, params)
    {
      year: HistoricalPrice.since_last_year,
      month: HistoricalPrice.since_one_month,
      week: HistoricalPrice.since_one_week,
      by_date: HistoricalPrice.by_date(date_format(params[:from]), date_format(params[:to])),
    }[type]&.order(price_date: :desc)
  end

  def date_format(date)
    Date.parse(date)
  end
end
