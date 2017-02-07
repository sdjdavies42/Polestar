class CarsController < ApplicationController

	# GET request to /users/:user_id/cars/new
	def new
		@car = Car.new
	end

	# POST request to /users/:user_id/cars
	def create
		# Finds user who is filling out form
		@user = User.find( params[:user_id] )
		# Create car linked to this specific user
		@car = @user.build_car( car_params )
		if @car.save 
			redirect_to user_profile_path
		end
	end

	private
		def car_params
			params.require(:car).permit(:year, :make, :model, :miles, :transmission, :description)
		end
end