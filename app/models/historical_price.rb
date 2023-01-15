class HistoricalPrice < ApplicationRecord
  validates :open, :high, :low, :close, :volume, presence: true, numericality: { greater_than_or_equal_to: 0}

  validates :close_date, presence: true, uniqueness: true
end
