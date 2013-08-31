require 'test_helper'

class ConnsControllerTest < ActionController::TestCase
  setup do
    @conn = conns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create conn" do
    assert_difference('Conn.count') do
      post :create, conn: { access_key: @conn.access_key, end_point: @conn.end_point, secret_access_key: @conn.secret_access_key }
    end

    assert_redirected_to conn_path(assigns(:conn))
  end

  test "should show conn" do
    get :show, id: @conn
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @conn
    assert_response :success
  end

  test "should update conn" do
    put :update, id: @conn, conn: { access_key: @conn.access_key, end_point: @conn.end_point, secret_access_key: @conn.secret_access_key }
    assert_redirected_to conn_path(assigns(:conn))
  end

  test "should destroy conn" do
    assert_difference('Conn.count', -1) do
      delete :destroy, id: @conn
    end

    assert_redirected_to conns_path
  end
end
