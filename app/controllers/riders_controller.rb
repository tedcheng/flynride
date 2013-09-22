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
    
  
  end
  
  def create
    
  
  end
  
  def destroy
    
  end
  
end
