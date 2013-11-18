require 'test_helper'

class Store::LeadsControllerTest < ActionController::TestCase
  setup do
    @store_lead = store_leads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:store_leads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create store_lead" do
    assert_difference('Store::Lead.count') do
      post :create, store_lead: { address: @store_lead.address, aux: @store_lead.aux, color: @store_lead.color, comments: @store_lead.comments, email: @store_lead.email, item_id: @store_lead.item_id, name: @store_lead.name, phone: @store_lead.phone, quantity: @store_lead.quantity, size: @store_lead.size }
    end

    assert_redirected_to store_lead_path(assigns(:store_lead))
  end

  test "should show store_lead" do
    get :show, id: @store_lead
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @store_lead
    assert_response :success
  end

  test "should update store_lead" do
    patch :update, id: @store_lead, store_lead: { address: @store_lead.address, aux: @store_lead.aux, color: @store_lead.color, comments: @store_lead.comments, email: @store_lead.email, item_id: @store_lead.item_id, name: @store_lead.name, phone: @store_lead.phone, quantity: @store_lead.quantity, size: @store_lead.size }
    assert_redirected_to store_lead_path(assigns(:store_lead))
  end

  test "should destroy store_lead" do
    assert_difference('Store::Lead.count', -1) do
      delete :destroy, id: @store_lead
    end

    assert_redirected_to store_leads_path
  end
end
