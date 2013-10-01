require 'google_directions'

class RidersController < ApplicationController
  
  def compute_distance (origin, destination)
    directions = GoogleDirections.new(origin, destination)
    logger.debug directions.distance_in_miles
    
    return directions.distance_in_miles, directions.status
  end

  def rank_distances  
    distances = Array.new

    Rider.find_all_by_flight_id(current_rider.flight_id).map do |rider|
      next if rider == current_rider
      computed_distance, status = compute_distance(rider.final_dest, current_rider.final_dest)

      if status != "NOT_FOUND"
        distances << {:id=>rider.id, :distance=>computed_distance, :final_dest=>rider.final_dest}
      end         
    end

    return distances.sort_by {|a| a[:distance]}
  end


  def index
    @rank_results = rank_distances    
  #  render :json => @rank_results

    p @rank_results
    render :index
  end
  
  def new
    if current_user
      @rider = current_user.riders.first || Rider.new(:user_id => current_user.id)
    else
      @rider = Rider.new
    end
    
    render :new
  end
  
  def update
    current_rider = Rider.find_by_id(params[:id])
    current_rider.update_attributes(params[:rider])
    
    current_flight = Flight.find_by_flight_no_and_date(params[:flight][:flight_no],params[:flight][:date]) || Flight.new(params[:flight])
    current_flight.save!
    
    current_rider.flight_id = current_flight.id
    
    current_rider.save!
    
    redirect_to riders_url
  end
  
  def create
    
  
  end
  
  def destroy
    
  end
  
end
