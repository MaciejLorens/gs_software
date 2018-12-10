require 'test_helper'

class LocaleControllerTest < ActionDispatch::IntegrationTest
  test "should get set_local" do
    get locale_set_local_url
    assert_response :success
  end

end
