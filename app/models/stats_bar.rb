class StatsBar < ActiveRecord::Base
	scope :gcs, where(:coin => "GCS").order("created_at DESC").limit(10)
	scope :btc, where(:coin => "BTC").order("created_at DESC").limit(10)
	scope :ltc, where(:coin => "LTC").order("created_at DESC").limit(10)
	scope :doge, where(:coin => "DOGE").order("created_at DESC").limit(10)
end
