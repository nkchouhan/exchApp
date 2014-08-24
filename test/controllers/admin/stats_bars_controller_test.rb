require 'test_helper'

class Admin::StatsBarsControllerTest < ActionController::TestCase
  setup do
    @admin_stats_bar = admin_stats_bars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_stats_bars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_stats_bar" do
    assert_difference('Admin::StatsBar.count') do
      post :create, admin_stats_bar: { ask: @admin_stats_bar.ask, bid: @admin_stats_bar.bid, coin: @admin_stats_bar.coin, high: @admin_stats_bar.high, last: @admin_stats_bar.last, vol: @admin_stats_bar.vol }
    end

    assert_redirected_to admin_stats_bar_path(assigns(:admin_stats_bar))
  end

  test "should show admin_stats_bar" do
    get :show, id: @admin_stats_bar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_stats_bar
    assert_response :success
  end

  test "should update admin_stats_bar" do
    patch :update, id: @admin_stats_bar, admin_stats_bar: { ask: @admin_stats_bar.ask, bid: @admin_stats_bar.bid, coin: @admin_stats_bar.coin, high: @admin_stats_bar.high, last: @admin_stats_bar.last, vol: @admin_stats_bar.vol }
    assert_redirected_to admin_stats_bar_path(assigns(:admin_stats_bar))
  end

  test "should destroy admin_stats_bar" do
    assert_difference('Admin::StatsBar.count', -1) do
      delete :destroy, id: @admin_stats_bar
    end

    assert_redirected_to admin_stats_bars_path
  end
end
