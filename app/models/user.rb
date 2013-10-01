class User < ActiveRecord::Base
  attr_accessible :id, :phone_no, :token, :confirm_code

  has_many :riders
  
  def set_token
    self.token = SecureRandom.urlsafe_base64
     
  end
  
  def self.verify_credentials(phone_no, confirm_code)
    user = User.find_by_phone_no(phone_no)
    db_confirm_code = user.confirm_code
    
    user && db_confirm_code == confirm_code
  end

end