require 'test_helper'

class AdminsBackoffice::ShepherdsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_backoffice_shepherds_index_url
    assert_response :success
  end

end
