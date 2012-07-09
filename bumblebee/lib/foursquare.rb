require "net/http"
require "uri"

module Foursquare
  HOST = "api.foursquare.com"
  PORT = 443
  BASE_PATH = "/v2"
  CLIENT_ID = "BWG51PPJDCCLOZQ5OXEJDSLMRNAJW4O4ONO3F4ONMXHI5QON"
  CLIENT_SECRET = "NREKYUWFQK5JEKSCZXNZO4LH3UO0ZP2PD1XCEBFEMKLETKML"
  
  # Returns a Net::HTTP response from api.foursquare.com/venues/search?ll=...
  def self.venue_search(lat, long)
    http = Net::HTTP.new(HOST, PORT)
    http.use_ssl = true
    request = Net::HTTP::Get.new(
        "#{BASE_PATH}/venues/search?ll=#{lat},#{long}" + 
        "&client_id=#{CLIENT_ID}&client_secret=#{CLIENT_SECRET}")
    http.request(request)
  end
end
