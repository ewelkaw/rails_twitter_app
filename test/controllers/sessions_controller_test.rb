require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sessions_new_url # login_path
    assert_response :success
  end

end
