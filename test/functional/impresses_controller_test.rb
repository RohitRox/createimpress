require 'test_helper'

class ImpressesControllerTest < ActionController::TestCase
  setup do
    @impress = impresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:impresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create impress" do
    assert_difference('Impress.count') do
      post :create, impress: @impress.attributes
    end

    assert_redirected_to impress_path(assigns(:impress))
  end

  test "should show impress" do
    get :show, id: @impress.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @impress.to_param
    assert_response :success
  end

  test "should update impress" do
    put :update, id: @impress.to_param, impress: @impress.attributes
    assert_redirected_to impress_path(assigns(:impress))
  end

  test "should destroy impress" do
    assert_difference('Impress.count', -1) do
      delete :destroy, id: @impress.to_param
    end

    assert_redirected_to impresses_path
  end
end
