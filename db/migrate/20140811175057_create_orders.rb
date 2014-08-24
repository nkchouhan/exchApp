class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :status
      t.string :type
      t.string :coin
      t.float :quantity
      t.datetime :date
      t.float :bid_ask

      t.timestamps
    end
  end
end
