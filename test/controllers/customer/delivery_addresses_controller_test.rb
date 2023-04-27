require "test_helper"

class Customer::DeliveryAddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_delivery_addresses_index_url
    assert_response :success
  end

  test "should get edit" do
    get customer_delivery_addresses_edit_url
    assert_response :success
  end

  test "should get create" do
    get customer_delivery_addresses_create_url
    assert_response :success
  end

  test "should get update" do
    get customer_delivery_addresses_update_url
    assert_response :success
  end

  test "should get destroy" do
    get customer_delivery_addresses_destroy_url
    assert_response :success
  end
end
