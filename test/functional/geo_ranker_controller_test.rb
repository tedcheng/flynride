require 'test_helper'

class GeoRankerControllerTest < ActionController::TestCase
  test "should get compute_distance" do
    get :compute_distance
    assert_response :success
  end

  test "should get rank_distances" do
    get :rank_distances
    assert_response :success
  end

end
