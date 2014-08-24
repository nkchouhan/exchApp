class CreateWithdrawls < ActiveRecord::Migration
  def change
    create_table :withdrawls do |t|
      t.string :account_number
      t.string :pin
      t.string :coin_address
      t.string :coin

      t.timestamps
    end
  end
end
