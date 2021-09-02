require 'test_helper'

class AcceptConditionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @accept_condition = accept_conditions(:one)
  end

  test "should get index" do
    get accept_conditions_url
    assert_response :success
  end

  test "should get new" do
    get new_accept_condition_url
    assert_response :success
  end

  test "should create accept_condition" do
    assert_difference('AcceptCondition.count') do
      post accept_conditions_url, params: { accept_condition: { content: @accept_condition.content, importance: @accept_condition.importance, user_id: @accept_condition.user_id } }
    end

    assert_redirected_to accept_condition_url(AcceptCondition.last)
  end

  test "should show accept_condition" do
    get accept_condition_url(@accept_condition)
    assert_response :success
  end

  test "should get edit" do
    get edit_accept_condition_url(@accept_condition)
    assert_response :success
  end

  test "should update accept_condition" do
    patch accept_condition_url(@accept_condition), params: { accept_condition: { content: @accept_condition.content, importance: @accept_condition.importance, user_id: @accept_condition.user_id } }
    assert_redirected_to accept_condition_url(@accept_condition)
  end

  test "should destroy accept_condition" do
    assert_difference('AcceptCondition.count', -1) do
      delete accept_condition_url(@accept_condition)
    end

    assert_redirected_to accept_conditions_url
  end
end
