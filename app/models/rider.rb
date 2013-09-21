class Rider < ActiveRecord::Base
  attr_accessible :final_dest, :flight_id, :id, :user_id
end
