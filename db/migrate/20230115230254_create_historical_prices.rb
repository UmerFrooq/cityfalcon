class CreateHistoricalPrices < ActiveRecord::Migration[7.0]
  def change
    create_table :historical_prices do |t|
      t.date :price_date
      t.jsonb :price_hash, default: {}
      t.timestamps
    end
  end
end
