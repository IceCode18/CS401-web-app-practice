require 'test_helper'

class PublicCouponsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_coupons_index_url
    assert_response :success
  end

  test "should get show" do
    get public_coupons_show_url
    assert_response :success
  end

end
