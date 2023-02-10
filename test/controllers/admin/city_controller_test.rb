require "test_helper"

class Admin::CityControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_city_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_city_index_url
    assert_response :success
  end
end
