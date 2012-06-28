require 'test_helper'

class ApiKeysControllerTest < ActionController::TestCase
  setup do
    @api_key = api_keys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:api_keys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create api_key" do
    assert_difference('ApiKey.count') do
      post :create, api_key: @api_key.attributes
    end

    assert_redirected_to api_key_path(assigns(:api_key))
  end

  test "should show api_key" do
    get :show, id: @api_key.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @api_key.to_param
    assert_response :success
  end

  test "should update api_key" do
    put :update, id: @api_key.to_param, api_key: @api_key.attributes
    assert_redirected_to api_key_path(assigns(:api_key))
  end

  test "should destroy api_key" do
    assert_difference('ApiKey.count', -1) do
      delete :destroy, id: @api_key.to_param
    end

    assert_redirected_to api_keys_path
  end
end
