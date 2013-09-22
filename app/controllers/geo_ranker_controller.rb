require 'google_directions'

class GeoRankerController < ApplicationController
  
  def compute_distance (origin, destination)
  	directions = GoogleDirections.new(origin, destination)
  	logger.debug directions.distance_in_miles
  	return directions.distance_in_miles, directions.status
  end

  def rank_distances	

  	distances = Array.new

  	Rider.find_all_by_flight_id(self.flight_id).map do |rider|
      next if rider == self
		computed_distance, status = compute_distance(peer[:final_dest], self[:final_dest])

  		if status != "NOT_FOUND"
  			distances << {:id=>rider[:id], :distance=>computed_distance}
  		end	      	
    end

  	return distances.sort_by {|a| a[:distance]}
  end
end
