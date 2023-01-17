class HistoricalPrice < ApplicationRecord
  validates :price_date, presence: true

  scope :since_last_year, -> { where("price_date >= ? AND price_date <= ?", 365.day.ago.to_date, Date.today) }
  scope :since_one_month, -> { where("price_date >= ? AND price_date <= ?", 1.month.ago.to_date, Date.today) }
  scope :since_one_week, -> { where("price_date >= ? AND price_date <= ?", 1.week.ago.to_date, Date.today) }
  scope :by_date, -> (start, end_date) { where("date(price_date) >= ? AND date(price_date) <= ?", start, end_date) }
  
  def last_close_value
    price_hash&.last.dig("close")
  end

  def self.yesterday
    find_by(price_date: 1.day.ago.to_date)
  end

  def self.today
    find_by(price_date: Date.today)
  end
end
