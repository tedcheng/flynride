class User < ActiveRecord::Base
  attr_accessible :id, :phone_no

  has_many :riders
  
  def set_session
    self.token = SecureRandom.random_number(10000)
  end
  
end