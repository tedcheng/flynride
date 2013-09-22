class Flight < ActiveRecord::Base
  attr_accessible :date, :flight_no, :id
  
  has_many :riders
end
