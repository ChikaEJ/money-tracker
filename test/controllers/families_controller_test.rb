require "test_helper"

class FamiliesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get families_index_url
    assert_response :success
  end

  test "should get create" do
    get families_create_url
    assert_response :success
  end

  test "should get new" do
    get families_new_url
    assert_response :success
  end

  test "should get update" do
    get families_update_url
    assert_response :success
  end

  test "should get show" do
    get families_show_url
    assert_response :success
  end

  test "should get delete" do
    get families_delete_url
    assert_response :success
  end
end
