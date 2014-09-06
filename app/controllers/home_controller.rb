class HomeController < ApplicationController
  before_action :authenticate_user!, :only => [:dashboard]
  
  def dashboard
    @account_histories = current_user.account_histories
    @orders = current_user.orders.pending
    @stats_bars = StatsBar.all
    @admin_stats_bars = StatsBar.all
    @withdrawls = Withdrawl.all
    respond_to do |format|
      format.html
      format.csv { render text: @account_histories.to_csv }
    end
  end
  
  def index
  end
end
