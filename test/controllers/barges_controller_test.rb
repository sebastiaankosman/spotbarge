require 'test_helper'

class BargesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get barges_index_url
    assert_response :success
  end

  test "should get new" do
    get barges_new_url
    assert_response :success
  end

  test "should get create" do
    get barges_create_url
    assert_response :success
  end

end
