class CarsController < ApplicationController
	
	# GET request to /users/:user_id/cars/new
	def new
		@user = User.find( params[:user_id] )
		@car = @user.cars.build
	end

	# POST request to /users/:user_id/cars
	def create
		@user = User.find( params[:user_id] )
		@car = @user.cars.build( car_params )
		if @car.save
			redirect_to user_path( params[:user_id] )
		end
	end

	#GET request to /users/:user_id/cars/:id
	def show
		@user = User.find( params[:user_id]	)
		@car = @user.cars.find( params[:id] )
	end

	def index 
		@cars = Car.all
	end

	private
		def car_params
			params.require(:car).permit(:category, :year, :make, :model, :miles, :transmission, :price, :description)
		end
end