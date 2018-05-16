require 'test_helper'

class FleetControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fleet_index_url
    assert_response :success
  end

end
