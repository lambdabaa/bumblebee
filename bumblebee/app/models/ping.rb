class Ping < ActiveRecord::Base
  attr_accessible :user, :latitude, :longitude
  
  belongs_to :user
end
