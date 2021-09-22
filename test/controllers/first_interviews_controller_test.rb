require 'test_helper'

class FirstInterviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get first_interviews_index_url
    assert_response :success
  end

end
