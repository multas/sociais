require 'test_helper'

class MultasControllerTest < ActionController::TestCase
  setup do
    @multa = multas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:multas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create multa" do
    assert_difference('Multa.count') do
      post :create, multa: @multa.attributes
    end

    assert_redirected_to multa_path(assigns(:multa))
  end

  test "should show multa" do
    get :show, id: @multa.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @multa.to_param
    assert_response :success
  end

  test "should update multa" do
    put :update, id: @multa.to_param, multa: @multa.attributes
    assert_redirected_to multa_path(assigns(:multa))
  end

  test "should destroy multa" do
    assert_difference('Multa.count', -1) do
      delete :destroy, id: @multa.to_param
    end

    assert_redirected_to multas_path
  end
end
