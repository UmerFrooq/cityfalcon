class HistoricalPrice < ApplicationRecord
  validates :open, :high, :low, :close, :volume, presence: true, numericality: { greater_than_or_equal_to: 0}
end
