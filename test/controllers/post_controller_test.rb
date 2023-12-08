require "test_helper"

class PostControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get post_index_url
    assert_response :success
  end

  test "should get show" do
    get post_show_url
    assert_response :success
  end

  test "should get create" do
    get post_create_url
    assert_response :success
  end

  test "should get edeit" do
    get post_edeit_url
    assert_response :success
  end

  test "should get destroy" do
    get post_destroy_url
    assert_response :success
  end
end
