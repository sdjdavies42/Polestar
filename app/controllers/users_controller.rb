class UsersController < ApplicationController
	# GET request to users/:id/
	def show
		@user = User.find( params[:id] )
		@cars = @user.cars
	end

	def index
		@users = User.includes(:profile)
	end
	
end