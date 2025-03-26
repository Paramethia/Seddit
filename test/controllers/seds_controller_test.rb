require "test_helper"

class SedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sed = seds(:one)
  end

  test "should get index" do
    get seds_url
    assert_response :success
  end

  test "should get new" do
    get new_sed_url
    assert_response :success
  end

  test "should create sed" do
    assert_difference("Sed.count") do
      post seds_url, params: { sed: { content: @sed.content, sedder: @sed.sedder, subseddit_id: @sed.subseddit_id, title: @sed.title } }
    end

    assert_redirected_to sed_url(Sed.last)
  end

  test "should show sed" do
    get sed_url(@sed)
    assert_response :success
  end

  test "should get edit" do
    get edit_sed_url(@sed)
    assert_response :success
  end

  test "should update sed" do
    patch sed_url(@sed), params: { sed: { content: @sed.content, sedder: @sed.sedder, subseddit_id: @sed.subseddit_id, title: @sed.title } }
    assert_redirected_to sed_url(@sed)
  end

  test "should destroy sed" do
    assert_difference("Sed.count", -1) do
      delete sed_url(@sed)
    end

    assert_redirected_to seds_url
  end
end
