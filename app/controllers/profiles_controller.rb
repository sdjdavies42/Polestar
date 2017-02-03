class ProfilesController < ApplicationController
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

	private
		def profile_params
			params.require(:profile).permit(:company, :name, :location, :phone_number, :email, :about)
		end
end