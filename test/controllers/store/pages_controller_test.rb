require 'test_helper'

class Store::PagesControllerTest < ActionController::TestCase
  setup do
    @store_page = store_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:store_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create store_page" do
    assert_difference('Store::Page.count') do
      post :create, store_page: {  }
    end

    assert_redirected_to store_page_path(assigns(:store_page))
  end

  test "should show store_page" do
    get :show, id: @store_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @store_page
    assert_response :success
  end

  test "should update store_page" do
    patch :update, id: @store_page, store_page: {  }
    assert_redirected_to store_page_path(assigns(:store_page))
  end

  test "should destroy store_page" do
    assert_difference('Store::Page.count', -1) do
      delete :destroy, id: @store_page
    end

    assert_redirected_to store_pages_path
  end
end
