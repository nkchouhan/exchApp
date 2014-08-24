class AddUserIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :user_id, :integer
    rename_column :orders, :type, :trsn_type
    rename_column :orders, :date, :odr_date
  end
end
