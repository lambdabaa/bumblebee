class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @categories = {}
    @user.pings.each do |ping|
      @categories[ping.location.category] ||= 0
      @categories[ping.location.category] += 1
    end
    
    p @categories
  end
end
