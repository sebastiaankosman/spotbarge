require 'test_helper'

class CargosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cargos_index_url
    assert_response :success
  end

  test "should get new" do
    get cargos_new_url
    assert_response :success
  end

  test "should get create" do
    get cargos_create_url
    assert_response :success
  end

end
