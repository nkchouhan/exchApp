class Admin::StatsBarsController < ApplicationController
  before_action :set_admin_stats_bar, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :check_admin?
  
  # GET /admin/stats_bars
  # GET /admin/stats_bars.json
  def index
    @admin_stats_bars = StatsBar.all.order("created_at DESC").limit(10)
  end

  # GET /admin/stats_bars/1
  # GET /admin/stats_bars/1.json
  def show
  end

  # GET /admin/stats_bars/new
  def new
    @admin_stats_bar = StatsBar.new
  end

  # GET /admin/stats_bars/1/edit
  def edit
  end

  # POST /admin/stats_bars
  # POST /admin/stats_bars.json
  def create
    @admin_stats_bar = StatsBar.new(admin_stats_bar_params)

    respond_to do |format|
      if @admin_stats_bar.save
        format.html { redirect_to admin_stats_bar_path(@admin_stats_bar), notice: 'Stats bar was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_stats_bar }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_stats_bar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/stats_bars/1
  # PATCH/PUT /admin/stats_bars/1.json
  def update
    respond_to do |format|
      if @admin_stats_bar.update(admin_stats_bar_params)
        format.html { redirect_to admin_stats_bar_path(@admin_stats_bar), notice: 'Stats bar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_stats_bar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/stats_bars/1
  # DELETE /admin/stats_bars/1.json
  def destroy
    @admin_stats_bar.destroy
    respond_to do |format|
      format.html { redirect_to admin_stats_bars_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_stats_bar
      @admin_stats_bar = StatsBar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_stats_bar_params
      params.require(:stats_bar).permit(:coin, :bid, :ask, :high, :last, :vol, :low)
    end
end
