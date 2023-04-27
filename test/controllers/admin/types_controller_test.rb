require "test_helper"

class Admin::TypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_types_index_url
    assert_response :success
  end

  test "should get create" do
    get admin_types_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_types_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_types_update_url
    assert_response :success
  end
end
