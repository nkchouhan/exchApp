class AddFieldsToWithdrawl < ActiveRecord::Migration
  def change
    add_column :withdrawls, :user_id, :integer
    add_column :withdrawls, :is_confirm, :boolean, :default => false
    add_column :withdrawls, :confirmed_token, :string
    add_column :withdrawls, :confirmation_date, :datetime
    add_column :withdrawls, :verified_count_time, :integer, :default => 1
  end
end
