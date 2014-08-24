class Admin::HomeController < ApplicationController
  before_action :authenticate_user!
  
  def dashboard
    @admin_account_histories = AccountHistory.all
    @admin_orders = Order.all
    @admin_stats_bars = StatsBar.all
    @users = User.all
  end
  def btc
    @admin_stats_bars = StatsBar.all
    @coin_type = "btc" 
  end
  
  def ltc
    @admin_stats_bars = StatsBar.ltc
    @coin_type = "ltc" 
  end
  def doge
    @admin_stats_bars = StatsBar.doge
    @coin_type = "doge" 
  end
  def gcs
    @admin_stats_bars = StatsBar.gcs
    @coin_type = "gcs" 
  end
end
