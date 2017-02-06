class CarsController < ApplicationController

	# GET request to /users/:user_id/cars/new
	def new
		@car = Car.new
	end

end