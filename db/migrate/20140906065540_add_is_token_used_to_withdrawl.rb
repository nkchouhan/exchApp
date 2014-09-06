class AddIsTokenUsedToWithdrawl < ActiveRecord::Migration
  def change
    add_column :withdrawls, :is_token_used, :boolean, :default => false
  end
end
