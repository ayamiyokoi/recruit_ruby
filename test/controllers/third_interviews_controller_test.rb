require 'test_helper'

class ThirdInterviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get third_interviews_index_url
    assert_response :success
  end

end
