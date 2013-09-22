require 'twilio-ruby'

#development 
#account_sid = 'AC66be6b0404db8bc0c5e1ea7aeeab1cde'
#auth_token = 'fd54aa7b10d8e1660f15e104302f2c17'

#production 
account_sid = 'AC275d394d4f0465c8e0b6694216f29de2'
auth_token = 'e17754e672ee9ef3b21fd5708aba4314'


class SmsIncomingController < ApplicationController
  def examine
  	@input_number  = params[:From]
  	@input_message = params[:Body] 
 	logger.debug "from: #{@input_number} message:#{@input_message}"

 	@from_user =User.find_by_phone_no(@input_number)

 	@pairing = Pairing.find_by_user1_id(@from_user.id) || Paring.find_by_user2_id(@from_user.id)

 	twiml = Twilio::TwiML::Response.new do |r|
    	r.Sms "#{@input_message}", :from => @pairing.phone_virtual, :to => @pairing
  	end
  	
  	logger.debug "#{twiml.text}"

  	respond_to do |format|	
  		format.xml {render xml: twiml.text}
 	end 


  end


end
