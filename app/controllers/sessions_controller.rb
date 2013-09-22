require 'twilio-ruby'

#development 
# account_sid = 'AC66be6b0404db8bc0c5e1ea7aeeab1cde'
# auth_token = 'fd54aa7b10d8e1660f15e104302f2c17'

#production 
account_sid = 'AC275d394d4f0465c8e0b6694216f29de2'
auth_token = 'e17754e672ee9ef3b21fd5708aba4314'


class SessionsController < ApplicationController
  def new
    render :new
  end
  
  def broadcast
    account_sid = 'AC275d394d4f0465c8e0b6694216f29de2'
    auth_token = 'e17754e672ee9ef3b21fd5708aba4314'
    client = Twilio::REST::Client.new account_sid, auth_token
    
    confirm_code = SecureRandom.random_number(10000).to_s
    phone_num = params[:phone_num]
    
    user = User.find_by_phone_no(phone_num) || User.new(:phone_no => phone_num)
    
    user.confirm_code = confirm_code
    user.save!
    
    client.account.sms.messages.create(
        :from => "+19782527433",
        :to => phone_num,
        :body => confirm_code
    )
    
    render :json => "success"
  end
  
  def create
    phone_num = params[:phone_num]
    confirm_code = params[:confirmCode]

    if User.verify_credentials(phone_num, confirm_code)
      user = User.find_by_phone_no(phone_num)
      login(user)
      @rider = user.riders.first || Rider.new(user_id: user.id)
      @rider.save!
      redirect_to new_rider_url
    else
      redirect_to new_session_url
    end
    
  end

end
