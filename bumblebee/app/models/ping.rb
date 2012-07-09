class Ping < ActiveRecord::Base
  attr_accessible :user, :latitude, :longitude
  
  belongs_to :user
  
  # TODO(gareth): Remove this mock
  def location
    return MockLocation.new
  end
  
  class MockLocation
    def category
      "Fun"
    end
  end
end
