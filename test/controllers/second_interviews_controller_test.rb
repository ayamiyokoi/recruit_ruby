require 'test_helper'

class SecondInterviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get second_interviews_index_url
    assert_response :success
  end

end
