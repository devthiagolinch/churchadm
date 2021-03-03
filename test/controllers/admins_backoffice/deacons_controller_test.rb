require 'test_helper'

class AdminsBackoffice::DeaconsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_backoffice_deacons_index_url
    assert_response :success
  end

end
