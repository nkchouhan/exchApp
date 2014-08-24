class CreateAccountHistories < ActiveRecord::Migration
  def change
    create_table :account_histories do |t|
      t.datetime :ac_date
      t.float :btc
      t.float :doge
      t.float :gcs
      t.float :ltc
      t.string :details

      t.timestamps
    end
  end
end
