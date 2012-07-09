class Ping < ActiveRecord::Base
  attr_accessible :user, :latitude, :longitude, :location
  
  belongs_to :user
  belongs_to :location
end
