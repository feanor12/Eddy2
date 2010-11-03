require 'test_helper'

class StaticLinksControllerTest < ActionController::TestCase
  setup do
    @static_link = static_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:static_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create static_link" do
    assert_difference('StaticLink.count') do
      post :create, :static_link => @static_link.attributes
    end

    assert_redirected_to static_link_path(assigns(:static_link))
  end

  test "should show static_link" do
    get :show, :id => @static_link.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @static_link.to_param
    assert_response :success
  end

  test "should update static_link" do
    put :update, :id => @static_link.to_param, :static_link => @static_link.attributes
    assert_redirected_to static_link_path(assigns(:static_link))
  end

  test "should destroy static_link" do
    assert_difference('StaticLink.count', -1) do
      delete :destroy, :id => @static_link.to_param
    end

    assert_redirected_to static_links_path
  end
end
