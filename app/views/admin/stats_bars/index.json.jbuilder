json.array!(@admin_stats_bars) do |admin_stats_bar|
  json.extract! admin_stats_bar, :id, :coin, :bid, :ask, :high, :last, :vol
  json.url admin_stats_bar_url(admin_stats_bar, format: :json)
end
