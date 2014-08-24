class AddAccountNoToUser < ActiveRecord::Migration
  def change
    add_column :users, :account_no, :string
  end
end
