class PingsController < ApplicationController
  def create
    # TODO: Check that a user exists
    @user = User.find_or_create_by_id(params[:user_id])
    
    location_data = get_location(params[:latitude], params[:longitude])
    
    location = Location.find_or_create_by_name(
        location_data["name"])
    if !location.category
      category_name = location_data["categories"].find { |x| x["primary"] }["name"]
      category = Category.find_or_create_by_name(category_name)
      location.latitude = location_data["location"]["lat"]
      location.longitude = location_data["location"]["lng"]
      location.category = category
      location.save
    end
    
    # TODO: Check that arguments are okay
    @ping = Ping.new(
        :user => @user,
        :latitude => params[:latitude],
        :longitude => params[:longitude],
        :location => location)
    @ping.save
    
    response = Foursquare.venue_search(@ping.latitude, @ping.longitude)
    
    render :text => "200 OK"
  end
  
  def show
    @ping = Ping.find(params[:id])

    render :json => closest_location
  end
  
  private
  
  def get_location(latitude, longitude)
    response = Foursquare.venue_search(latitude, longitude)
    response_obj = JSON.parse(response.body)
    locations = response_obj["response"]["groups"].first["items"]
    locations.sort! {|a,b| a["location"]["distance"] <=> b["location"]["distance"]}
    locations.first
  end
  
end
