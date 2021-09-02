require "application_system_test_case"

class AcceptConditionsTest < ApplicationSystemTestCase
  setup do
    @accept_condition = accept_conditions(:one)
  end

  test "visiting the index" do
    visit accept_conditions_url
    assert_selector "h1", text: "Accept Conditions"
  end

  test "creating a Accept condition" do
    visit accept_conditions_url
    click_on "New Accept Condition"

    fill_in "Content", with: @accept_condition.content
    fill_in "Importance", with: @accept_condition.importance
    fill_in "User", with: @accept_condition.user_id
    click_on "Create Accept condition"

    assert_text "Accept condition was successfully created"
    click_on "Back"
  end

  test "updating a Accept condition" do
    visit accept_conditions_url
    click_on "Edit", match: :first

    fill_in "Content", with: @accept_condition.content
    fill_in "Importance", with: @accept_condition.importance
    fill_in "User", with: @accept_condition.user_id
    click_on "Update Accept condition"

    assert_text "Accept condition was successfully updated"
    click_on "Back"
  end

  test "destroying a Accept condition" do
    visit accept_conditions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Accept condition was successfully destroyed"
  end
end
