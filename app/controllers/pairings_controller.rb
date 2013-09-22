require 'twilio-ruby'


class PairingsController < ApplicationController
  def create
  	@pairing = Pairing.new(params[:pairing])
  	@pairing.phone_virtual = "+19782527433"

  	@pairing_second = Pairing.new(user1_id:params[:pairing][:user2_id],user2_id:params[:pairing][:user1_id])
	@pairing_second.phone_virtual = "+19782527433"

  	account_sid = 'AC275d394d4f0465c8e0b6694216f29de2'
	auth_token = 'e17754e672ee9ef3b21fd5708aba4314'
	client = Twilio::REST::Client.new account_sid, auth_token

	client.account.sms.messages.create(
    	:from => @pairing.phone_virtual,
    	:to => User.find_by_id(@pairing.user1_id).phone_no,
    	:body => "Use this anonymous number to contact your FlyNRide companion "
	)

	client.account.sms.messages.create(
    	:from => @pairing.phone_virtual,
    	:to => User.find_by_id(@pairing_second.user1_id).phone_no,
    	:body => "Use this anonymous number to correspond with a FlyNRide user that want to meet"
	)

  	if @pairing.save && @pairing_second.save
		render :json => @pairing
  	else
  		render :json => @pairing.errors.full_messages, :status => 422
  	end

  end

  def destroy
  end
end
