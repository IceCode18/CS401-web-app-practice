require 'test_helper'

class PassesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get passes_index_url
    assert_response :success
  end

end
