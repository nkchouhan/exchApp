class StatsBar < ActiveRecord::Base
	scope :gcs, where(:coin => "GCS")
	scope :btc, where(:coin => "BTC")
	scope :ltc, where(:coin => "LTC")
	scope :doge, where(:coin => "DOGE")
end
