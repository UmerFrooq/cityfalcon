class CreateHistoricalPrices < ActiveRecord::Migration[7.0]
  def change
    create_table :historical_prices do |t|
      t.decimal :close, :precision => 15, :scale => 4
      t.bigint :volume
      t.datetime :close_time
      t.timestamps
    end
  end
end
