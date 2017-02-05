class ProfilesController < ApplicationController

	before_action :authenticate_user!
	before_action :only_current_user

	# GET request to /users/:user_id/profile/new
	def new
		@profile = Profile.new
	end
	# POST request to /users/:user_id/profile
	def create
		@user = User.find( params[:user_id] )
		@profile = @user.build_profile( profile_params )
		if @profile.save
			flash[:success] = "You've created your dealership profile. Good selling!"
			redirect_to user_path( params[:user_id] )
		else
			render action: :new
		end
	end

	# GET request to /users/:user_id/profile/edit
	def edit
		@user = User.find( params[:user_id] )
		@profile = @user.profile
	end

	# PUT request to /users/:user_id/profile
	def update
		@user = User.find( params[:user_id] )
		@profile = @user.profile
		if @profile.update_attributes(profile_params)
			flash[:success] = "Page Updated"
			redirect_to user_path(id: params[:user_id] )
		else
			render action: :edit
		end
	end

	private
		def profile_params
			params.require(:profile).permit(:avatar, :company, :name, :location, :phone_number, :email, :about)
		end

		def only_current_user
			@user = User.find( params[:user_id] )
			redirect_to(root_url) unless @user == current_user
		end	
end