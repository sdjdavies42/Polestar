class Users::RegistrationsController < Devise::RegistrationsController
	before_action :select_plan, only: :new

	def create
		super do |resource| 
			if params[:plan]
				resource.plan_id = params[:plan]
				if resource.plan_id == 1
					resource.save_with_subscription
				end
			end
		end
	end
# Prevents user manipulating Plan ID no. in URL.
	private
		def select_plan
			unless (params[:plan] == '1')
				flash[:notice] = "Please select Dealership account to sign up."
				redirect_to root_path
			end
		end
end