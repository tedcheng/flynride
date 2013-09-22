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

 	@destination = ""

 	twiml = Twilio::TwiML::Response.new do |r|
		
		if (@input_number == "+12536938705")
			@destination = "+13058144826" 
    	else
    		@destination = "+12536938705" 
  		end


    	r.Sms "#{@input_message}", :from => "+19782527433", :to => @destination
  	end
  	
  	logger.debug "#{twiml.text}"

  	respond_to do |format|	
  		format.xml {render xml: twiml.text}
 	end 



  end


end
