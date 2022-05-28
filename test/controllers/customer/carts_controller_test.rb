require "test_helper"

class Customer::CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_carts_index_url
    assert_response :success
  end

  test "should get create" do
    get customer_carts_create_url
    assert_response :success
  end

  test "should get update" do
    get customer_carts_update_url
    assert_response :success
  end

  test "should get destroy" do
    get customer_carts_destroy_url
    assert_response :success
  end

  test "should get all_destroy" do
    get customer_carts_all_destroy_url
    assert_response :success
  end
end
