json.array!(@admin_account_histories) do |admin_account_history|
  json.extract! admin_account_history, :id, :ac_date, :btc, :doge, :gcs, :ltc, :details
  json.url admin_account_history_url(admin_account_history, format: :json)
end
