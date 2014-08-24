class Admin::OrdersController < ApplicationController
  before_action :set_admin_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /admin/orders
  # GET /admin/orders.json
  def index
    @admin_orders = Order.all
  end

  # GET /admin/orders/1
  # GET /admin/orders/1.json
  def show
  end

  # GET /admin/orders/new
  def new
		if params[:user_id].present?
		  user = User.find(params[:user_id])
		  @admin_order = user.orders.new
		else
			@admin_order = Order.new
		end
  end
  # GET /admin/orders/1/edit
  def edit
  end

  # POST /admin/orders
  # POST /admin/orders.json
  def create
    @admin_order = Order.new(admin_order_params)

    respond_to do |format|
      if @admin_order.save
        format.html { redirect_to admin_order_path(@admin_order), notice: 'Order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_order }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/orders/1
  # PATCH/PUT /admin/orders/1.json
  def update
    respond_to do |format|
      if @admin_order.update(admin_order_params)
        format.html { redirect_to admin_order_path(@admin_order), notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/orders/1
  # DELETE /admin/orders/1.json
  def destroy
    @admin_order.destroy
    respond_to do |format|
      format.html { redirect_to admin_orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_order
      @admin_order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_order_params
      params.require(:order).permit(:status, :coin, :quantity, :odr_date, :bid, :ask, :trsn_type, :user_id)
    end
end
