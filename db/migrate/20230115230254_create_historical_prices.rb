class CreateHistoricalPrices < ActiveRecord::Migration[7.0]
  def change
    create_table :historical_prices do |t|
      t.decimal :open, :precision => 15, :scale => 4
      t.decimal :high, :precision => 15, :scale => 4
      t.decimal :low, :precision => 15, :scale => 4
      t.decimal :close, :precision => 15, :scale => 4
      t.bigint :volume
      t.date :close_date
      t.timestamps
    end
  end
end
