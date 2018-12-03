require 'test_helper'

class InventoriesControllerTest < ActionController::TestCase
  setup do
    @inventory = inventories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inventories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inventory" do
    assert_difference('Inventory.count') do
      post :create, inventory: { available: @inventory.available, brand: @inventory.brand, bulk: @inventory.bulk, color: @inventory.color, date_purchased: @inventory.date_purchased, gear_category: @inventory.gear_category, gear_type: @inventory.gear_type, model: @inventory.model, purchase_method: @inventory.purchase_method, purchase_price: @inventory.purchase_price, reason: @inventory.reason, retail: @inventory.retail, serial_number: @inventory.serial_number, size: @inventory.size, total_spent: @inventory.total_spent }
    end

    assert_redirected_to inventory_path(assigns(:inventory))
  end

  test "should show inventory" do
    get :show, id: @inventory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inventory
    assert_response :success
  end

  test "should update inventory" do
    patch :update, id: @inventory, inventory: { available: @inventory.available, brand: @inventory.brand, bulk: @inventory.bulk, color: @inventory.color, date_purchased: @inventory.date_purchased, gear_category: @inventory.gear_category, gear_type: @inventory.gear_type, model: @inventory.model, purchase_method: @inventory.purchase_method, purchase_price: @inventory.purchase_price, reason: @inventory.reason, retail: @inventory.retail, serial_number: @inventory.serial_number, size: @inventory.size, total_spent: @inventory.total_spent }
    assert_redirected_to inventory_path(assigns(:inventory))
  end

  test "should destroy inventory" do
    assert_difference('Inventory.count', -1) do
      delete :destroy, id: @inventory
    end

    assert_redirected_to inventories_path
  end
end
