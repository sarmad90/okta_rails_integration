require 'test_helper'

class OauthControllerTest < ActionDispatch::IntegrationTest
  test "should get okta_callback" do
    get oauth_okta_callback_url
    assert_response :success
  end

end
