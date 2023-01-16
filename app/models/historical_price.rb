class HistoricalPrice < ApplicationRecord
  validates :close, :volume, presence: true, numericality: { greater_than_or_equal_to: 0}
  validates :close_time, presence: true
end
