require "application_system_test_case"

class SubsedditsTest < ApplicationSystemTestCase
  setup do
    @subseddit = subseddits(:one)
  end

  test "visiting the index" do
    visit subseddits_url
    assert_selector "h1", text: "Subseddits"
  end

  test "should create subseddit" do
    visit subseddits_url
    click_on "New subseddit"

    fill_in "Description", with: @subseddit.description
    fill_in "Owner", with: @subseddit.owner
    fill_in "Title", with: @subseddit.title
    click_on "Create Subseddit"

    assert_text "Subseddit was successfully created"
    click_on "Back"
  end

  test "should update Subseddit" do
    visit subseddit_url(@subseddit)
    click_on "Edit this subseddit", match: :first

    fill_in "Description", with: @subseddit.description
    fill_in "Owner", with: @subseddit.owner
    fill_in "Title", with: @subseddit.title
    click_on "Update Subseddit"

    assert_text "Subseddit was successfully updated"
    click_on "Back"
  end

  test "should destroy Subseddit" do
    visit subseddit_url(@subseddit)
    click_on "Destroy this subseddit", match: :first

    assert_text "Subseddit was successfully destroyed"
  end
end
