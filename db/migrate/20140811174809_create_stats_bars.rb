class CreateStatsBars < ActiveRecord::Migration
  def change
    create_table :stats_bars do |t|
      t.string :coin
      t.float :bid
      t.float :ask
      t.float :high
      t.float :vol
      t.float :last
      t.float :low

      t.timestamps
    end
  end
end
