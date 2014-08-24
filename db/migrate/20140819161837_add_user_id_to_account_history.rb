class AddUserIdToAccountHistory < ActiveRecord::Migration
  def change
    add_column :account_histories, :user_id, :integer
  end
end
