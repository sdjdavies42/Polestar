class PagesController < ApplicationController
	
	def home
		@dealer_plan = Plan.find(1)
		@car1 = Car.last
		@car2 = Car.last(2).first
		@car3 = Car.last(3).first
		@car4 = Car.last(4).first
	end

	def about
		@dealer_plan = Plan.find(1)
	end

	def rules

	end
	
end