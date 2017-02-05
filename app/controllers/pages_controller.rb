class PagesController < ApplicationController
	
	def home
		@dealer_plan = Plan.find(1)
	end

	def about
		@dealer_plan = Plan.find(1)
	end

end