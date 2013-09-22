require 'google_directions'

class GeoRankerController < ApplicationController
  
  def compute_distance (origin, destination)
  	directions = GoogleDirections.new(origin, destination)
  	logger.debug directions.distance_in_miles
  	return directions.distance_in_miles, directions.status
  end

  def rank_distances	
  	test_data = [
  		{:id => 1,:address=>'98052'},
  		{:id => 2,:address=>'33186'},
  		{:id => 3,:address=>'15213'},
 		{:id => 4,:address=>'99999'},
  	]

  	distances = Array.new

  	test_data.each do |peer|
  		computed_distance, status = compute_distance(peer[:address], "94110")

  		if status != "NOT_FOUND"
  			distances << {:id=>peer[:id], :distance=>computed_distance}
  		end

  	end
  	
  	return distances.sort_by {|a| a[:distance]}
  end
end
