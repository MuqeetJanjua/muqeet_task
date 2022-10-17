require "test_helper"

class LoginStoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get login_store_index_url
    assert_response :success
  end
end
