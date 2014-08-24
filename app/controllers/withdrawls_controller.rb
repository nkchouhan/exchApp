class WithdrawlsController < ApplicationController
  before_action :set_withdrawl, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /withdrawls
  # GET /withdrawls.json
  def index
    @withdrawls = Withdrawl.all
  end

  # GET /withdrawls/1
  # GET /withdrawls/1.json
  def show
  end

  # GET /withdrawls/new
  def new
    @withdrawl = Withdrawl.new
  end

  # GET /withdrawls/1/edit
  def edit
  end

  # POST /withdrawls
  # POST /withdrawls.json
  def create
    @withdrawl = Withdrawl.new(withdrawl_params)

    respond_to do |format|
      if @withdrawl.save
        @withdrawl.update_attributes(:confirmed_token => SecureRandom.urlsafe_base64)
        UserMailer.withdrawl_confirmation(@withdrawl).deliver
        format.html { redirect_to withdrawls_path, notice: 'Withdrawl was successfully created.' }
        #format.json { render action: 'show', status: :created, location: @withdrawl }
      else
        format.html { render action: 'new' }
        format.json { render json: @withdrawl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /withdrawls/1
  # PATCH/PUT /withdrawls/1.json
  def update
    respond_to do |format|
      if @withdrawl.update(withdrawl_params)
        format.html { redirect_to @withdrawl, notice: 'Withdrawl was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @withdrawl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /withdrawls/1
  # DELETE /withdrawls/1.json
  def destroy
    @withdrawl.destroy
    respond_to do |format|
      format.html { redirect_to withdrawls_url }
      format.json { head :no_content }
    end
  end
  
  def confirm
		unless params[:wdl_token].blank?
			withdrawl = current_user.withdrawls.where("confirmed_token =? AND verified_count_time = ?", params[:wdl_token], 1).first
			withdrawl.update_attributes(:is_confirm => true, :confirmation_date => Time.now, :verified_count_time => 2) unless withdrawl.blank?
		end
		redirect_to withdrawls_path, notice: 'Withdrawl has confirmed successfully.'
  end
  
  def deposit
    @coin_address  = ""
		unless params[:coin].blank?
			withdrawl = current_user.withdrawls.where("coin =?", params[:coin]).first      
			if withdrawl.present?
				@coin_address = withdrawl.coin_address 
				UserMailer.notify_deposit(withdrawl, params[:coin]).deliver
			end
		end
		
		render "deposit", notice: 'Deposit successfully.'
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_withdrawl
      @withdrawl = Withdrawl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def withdrawl_params
      params.require(:withdrawl).permit(:account_number, :coin, :coin_address, :pin, :user_id)
    end
end
