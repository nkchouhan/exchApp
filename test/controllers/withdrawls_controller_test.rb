require 'test_helper'

class WithdrawlsControllerTest < ActionController::TestCase
  setup do
    @withdrawl = withdrawls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:withdrawls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create withdrawl" do
    assert_difference('Withdrawl.count') do
      post :create, withdrawl: { account_number: @withdrawl.account_number, coin: @withdrawl.coin, coin_address: @withdrawl.coin_address, pin: @withdrawl.pin }
    end

    assert_redirected_to withdrawl_path(assigns(:withdrawl))
  end

  test "should show withdrawl" do
    get :show, id: @withdrawl
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @withdrawl
    assert_response :success
  end

  test "should update withdrawl" do
    patch :update, id: @withdrawl, withdrawl: { account_number: @withdrawl.account_number, coin: @withdrawl.coin, coin_address: @withdrawl.coin_address, pin: @withdrawl.pin }
    assert_redirected_to withdrawl_path(assigns(:withdrawl))
  end

  test "should destroy withdrawl" do
    assert_difference('Withdrawl.count', -1) do
      delete :destroy, id: @withdrawl
    end

    assert_redirected_to withdrawls_path
  end
end
