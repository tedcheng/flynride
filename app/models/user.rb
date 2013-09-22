class User < ActiveRecord::Base
  attr_accessible :id, :phone_no

  has_many :riders
end
