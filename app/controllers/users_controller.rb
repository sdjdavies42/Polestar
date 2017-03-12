class UsersController < ApplicationController
	# GET request to users/:id/
	def show
		@user = User.find( params[:id] )
		@cars = @user.cars
	end
	
	# GET request to users
	def index
		@users = User.includes(:profile).search( params[:search] )
		@locations = Profile.uniq.pluck(:location)
	end
	
end