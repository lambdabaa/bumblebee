class PingsController < ApplicationController
  def create
    # TODO: Check that a user exists
    @user = User.find(params[:uid])
    
    # TODO: Check that arguments are okay
    @ping = Ping.new(
        :user => @user,
        :latitude => params[:latitude],
        :longitude => params[:longitude])
    @ping.save
    
    render :text => "200 OK"
  end
end
