class Rider < ActiveRecord::Base
  attr_accessible :final_dest, :flight_id, :id, :user_id

  belongs_to :user
  belongs_to :flight
  
  
  def address_lists

    Rider.find_all_by_flight_id(self.flight_id).map do |rider|
      next if rider == self
      [self.user_id, self.final_dest]
    end

  end
  
end
