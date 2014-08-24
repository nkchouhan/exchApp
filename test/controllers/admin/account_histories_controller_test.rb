require 'test_helper'

class Admin::AccountHistoriesControllerTest < ActionController::TestCase
  setup do
    @admin_account_history = admin_account_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_account_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_account_history" do
    assert_difference('Admin::AccountHistory.count') do
      post :create, admin_account_history: { ac_date: @admin_account_history.ac_date, btc: @admin_account_history.btc, details: @admin_account_history.details, doge: @admin_account_history.doge, gcs: @admin_account_history.gcs, ltc: @admin_account_history.ltc }
    end

    assert_redirected_to admin_account_history_path(assigns(:admin_account_history))
  end

  test "should show admin_account_history" do
    get :show, id: @admin_account_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_account_history
    assert_response :success
  end

  test "should update admin_account_history" do
    patch :update, id: @admin_account_history, admin_account_history: { ac_date: @admin_account_history.ac_date, btc: @admin_account_history.btc, details: @admin_account_history.details, doge: @admin_account_history.doge, gcs: @admin_account_history.gcs, ltc: @admin_account_history.ltc }
    assert_redirected_to admin_account_history_path(assigns(:admin_account_history))
  end

  test "should destroy admin_account_history" do
    assert_difference('Admin::AccountHistory.count', -1) do
      delete :destroy, id: @admin_account_history
    end

    assert_redirected_to admin_account_histories_path
  end
end
