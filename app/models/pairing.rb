class Pairing < ActiveRecord::Base
  attr_accessible :id, :phone_virtual, :user1_id, :user2_id
end
