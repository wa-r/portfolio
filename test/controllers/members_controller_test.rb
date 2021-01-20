require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get members_show_url
    assert_response :success
  end

  test "should get edit" do
    get members_edit_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get members_unsubscribe_url
    assert_response :success
  end

end
