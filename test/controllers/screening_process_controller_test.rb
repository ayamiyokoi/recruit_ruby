require 'test_helper'

class ScreeningProcessControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get screening_process_index_url
    assert_response :success
  end

end
