class PingsController < ApplicationController
  def create
    # TODO: Check that a user exists
    @user = User.find(params[:user_id])
    
    # TODO: Check that arguments are okay
    @ping = Ping.new(
        :user => @user,
        :latitude => params[:latitude],
        :longitude => params[:longitude])
    @ping.save
    
    render :text => "200 OK"
  end
  
  def show
    @ping = Ping.find(params[:id])
    response = Foursquare.venue_search(@ping.latitude, @ping.longitude)
    render :json => response.body
  end
end
