class MakeSeperateFieldsToOrder < ActiveRecord::Migration
  def change
    rename_column :orders, :bid_ask, :bid
    add_column :orders, :ask, :float
  end
end
