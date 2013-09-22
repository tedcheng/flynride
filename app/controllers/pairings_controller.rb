class PairingsController < ApplicationController
  def create
  	@pairing = Pairing.new(params[:paring])
  	@pairing.phone_virtual = "+19782527433"

  	if @pairing.save 
		render :json => @pairing
  	else
  		render :json => @pairing.errors.full_messages, :status => 422
  	end

  end

  def destroy
  end
end
