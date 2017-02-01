class Users::RegistrationsController < Devise::RegistrationsController
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
end