require 'test_helper'

class VehicleInfoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vehicle_info_index_url
    assert_response :success
  end

end
