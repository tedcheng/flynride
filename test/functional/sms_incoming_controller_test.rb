require 'test_helper'

class SmsIncomingControllerTest < ActionController::TestCase
  test "should get examine" do
    get :examine
    assert_response :success
  end

end
