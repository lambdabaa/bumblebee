class Location < ActiveRecord::Base
  has_many :pings
  belongs_to :category
end
