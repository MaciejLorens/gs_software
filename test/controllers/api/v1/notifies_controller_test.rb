require 'test_helper'

class Api::V1::NotifiesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get api_v1_notifies_show_url
    assert_response :success
  end

end
