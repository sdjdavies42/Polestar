class CarsController < ApplicationController

	before_action :authenticate_user!, :except => [:index, :show]
	before_action :only_current_user, :except => [:index, :show, :new, :create]
	before_action :only_current_user_posts, :only => [:new]

	# GET request to /users/:user_id/cars/new
	def new
		@car = Car.new
		@user = User.find( params[:user_id] )
	end

	# POST request to /users/:user_id/cars
	def create
		@user = User.find( params[:user_id] )
		@car = @user.cars.build( car_params )
		if @car.save
			redirect_to user_path( params[:user_id] )
		end
	end

	# GET request to /cars/:id/edit
	def edit
		@car = Car.find( params[:id] )
	end

	# PATCH request to /cars/:id
	def update
		@car = Car.find( params[:id] )
		if @car.update_attributes( car_params )
			redirect_to car_path( params[:id] )
		end
	end

	# DELETE request to /cars/:id/
	def destroy
		@car = Car.find( params[:id] )
		@car.destroy
		redirect_to(root_url)
	end
	
	# GET request to /cars/:id/
	def show
		@car = Car.find( params[:id] )
		@user = @car.user
		@profile = @user.profile
	end

	# GET request to /cars/
	def index
		@cars = Car.paginate(:page => params[:page], :per_page => 4)
	end

	private
		def car_params
			params.require(:car).permit(:category, :year, :make, :model, :miles, :transmission, :price, :description, :image, :image2, :image3, :image4, :image5)
		end

		# Prevent other user editing/deleting posts
		def only_current_user
			@car = Car.find( params[:id] )
			@user = @car.user
			redirect_to(root_url) unless @user == current_user
		end

		# Only current user can post to that user's account
		def only_current_user_posts
			@user = User.find( params[:user_id] )
			redirect_to(root_url) unless @user == current_user
		end
end