require "application_system_test_case"

class SedsTest < ApplicationSystemTestCase
  setup do
    @sed = seds(:one)
  end

  test "visiting the index" do
    visit seds_url
    assert_selector "h1", text: "Seds"
  end

  test "should create sed" do
    visit seds_url
    click_on "New sed"

    fill_in "Content", with: @sed.content
    fill_in "Sedder", with: @sed.sedder
    fill_in "Subseddit", with: @sed.subseddit_id
    fill_in "Title", with: @sed.title
    click_on "Create Sed"

    assert_text "Sed was successfully created"
    click_on "Back"
  end

  test "should update Sed" do
    visit sed_url(@sed)
    click_on "Edit this sed", match: :first

    fill_in "Content", with: @sed.content
    fill_in "Sedder", with: @sed.sedder
    fill_in "Subseddit", with: @sed.subseddit_id
    fill_in "Title", with: @sed.title
    click_on "Update Sed"

    assert_text "Sed was successfully updated"
    click_on "Back"
  end

  test "should destroy Sed" do
    visit sed_url(@sed)
    click_on "Destroy this sed", match: :first

    assert_text "Sed was successfully destroyed"
  end
end
