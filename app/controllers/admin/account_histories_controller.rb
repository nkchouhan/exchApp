class Admin::AccountHistoriesController < ApplicationController
  before_action :set_admin_account_history, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /admin/account_histories
  # GET /admin/account_histories.json
  def index
    @admin_account_histories = AccountHistory.all
    respond_to do |format|
      format.html
      format.csv { render text: @admin_account_histories.to_csv }
    end
  end

  # GET /admin/account_histories/1
  # GET /admin/account_histories/1.json
  def show
  end

  # GET /admin/account_histories/new
  def new
    if params[:user_id].present?
		  user = User.find(params[:user_id])
		  @admin_account_history = user.account_histories.new
		else
			@admin_account_history = AccountHistory.new
		end
    
  end

  # GET /admin/account_histories/1/edit
  def edit
  end

  # POST /admin/account_histories
  # POST /admin/account_histories.json
  def create
    @admin_account_history = AccountHistory.new(admin_account_history_params)

    respond_to do |format|
      if @admin_account_history.save
        format.html { redirect_to admin_account_history_path(@admin_account_history), notice: 'Account history was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_account_history }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_account_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/account_histories/1
  # PATCH/PUT /admin/account_histories/1.json
  def update
    respond_to do |format|
      if @admin_account_history.update(admin_account_history_params)
        format.html { redirect_to admin_account_history_path(@admin_account_history), notice: 'Account history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_account_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/account_histories/1
  # DELETE /admin/account_histories/1.json
  def destroy
    @admin_account_history.destroy
    respond_to do |format|
      format.html { redirect_to admin_account_histories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_account_history
      @admin_account_history = AccountHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_account_history_params
      params.require(:account_history).permit(:ac_date, :btc, :doge, :gcs, :ltc, :details, :user_id)
    end
end
