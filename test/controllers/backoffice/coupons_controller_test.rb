require 'test_helper'

class Backoffice::CouponsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_coupons_index_url
    assert_response :success
  end

end
