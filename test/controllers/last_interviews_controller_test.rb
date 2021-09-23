require 'test_helper'

class LastInterviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get last_interviews_index_url
    assert_response :success
  end

end
