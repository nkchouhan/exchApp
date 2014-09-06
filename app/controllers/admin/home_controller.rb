class Admin::HomeController < ApplicationController
  before_action :authenticate_user!, :check_admin?
  
  def dashboard
    @admin_account_histories = AccountHistory.all
    @admin_orders = Order.all
    @admin_stats_bars = StatsBar.all
    @users = User.all
  end
  
  def role_type
    @user = User.find(params[:user_id])
  end
  
	def assign_role
		if params[:role].present? && params[:user_id].present?
			user = User.find(params[:user_id])
			if params[:role] == "make_a_admin"
				if user.has_role? :user
					user.add_role :admin
					user.remove_role :user
					flash[:notice] = "Already Role assign as Admin"
				elsif user.has_role? :admin
			    flash[:notice] = "Role assigned as Admin"
				end
			elsif params[:role] == "make_a_user"
				if user.has_role? :admin
					user.add_role :user
					user.remove_role :admin
					flash[:notice] = "Role assigned as User"
			  elsif user.has_role? :user
					flash[:notice] = "Already Role assign as User"
				end
			end
		end
		redirect_to root_path
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
