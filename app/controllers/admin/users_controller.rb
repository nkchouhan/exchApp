class Admin::OrdersController < ApplicationController
  #before_action :set_admin_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :check_admin?
  # GET /admin/orders
  # GET /admin/orders.json
  def index
    @users = User.all
  end

  #private
    # Use callbacks to share common setup or constraints between actions.
    #def set_user
      #@user = User.find(params[:id])
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
    #def user_params
     # params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :pin_code)
    #end
end
