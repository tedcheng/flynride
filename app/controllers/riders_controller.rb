class RidersController < ApplicationController
  def index
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
    
    current_flight = Flight.find_by_flight_no(params[:flight][:flight_no]) || Flight.new(params[:flight])
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
