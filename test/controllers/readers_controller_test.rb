require "test_helper"

class ReadersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get readers_index_url
    assert_response :success
  end

  test "should get block" do
    get readers_block_url
    assert_response :success
  end

  test "should get unblock" do
    get readers_unblock_url
    assert_response :success
  end
end
