class CreateDeposits < ActiveRecord::Migration
  def change
    create_table :deposits do |t|
      t.string :coin
      t.string :coin_address
      t.integer :user_id
      t.datetime :add_pull_at
      t.boolean :status
      t.integer :withdrawl_id

      t.timestamps
    end
  end
end
