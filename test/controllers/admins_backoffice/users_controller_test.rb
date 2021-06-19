require 'test_helper'

class AdminsBackoffice::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_backoffice_users_index_url
    assert_response :success
  end

end
