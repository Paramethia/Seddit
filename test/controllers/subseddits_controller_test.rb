require "test_helper"

class SubsedditsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subseddit = subseddits(:one)
  end

  test "should get index" do
    get subseddits_url
    assert_response :success
  end

  test "should get new" do
    get new_subseddit_url
    assert_response :success
  end

  test "should create subseddit" do
    assert_difference("Subseddit.count") do
      post subseddits_url, params: { subseddit: { description: @subseddit.description, owner: @subseddit.owner, title: @subseddit.title } }
    end

    assert_redirected_to subseddit_url(Subseddit.last)
  end

  test "should show subseddit" do
    get subseddit_url(@subseddit)
    assert_response :success
  end

  test "should get edit" do
    get edit_subseddit_url(@subseddit)
    assert_response :success
  end

  test "should update subseddit" do
    patch subseddit_url(@subseddit), params: { subseddit: { description: @subseddit.description, owner: @subseddit.owner, title: @subseddit.title } }
    assert_redirected_to subseddit_url(@subseddit)
  end

  test "should destroy subseddit" do
    assert_difference("Subseddit.count", -1) do
      delete subseddit_url(@subseddit)
    end

    assert_redirected_to subseddits_url
  end
end
