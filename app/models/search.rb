class Search < ApplicationRecord

	def search_cars

		cars = Car.all

		cars = cars.where(["make LIKE ?", "%#{make}%"]) if make.present?
		cars = cars.where(["model LIKE ?", "%#{model}%"]) if model.present?
		cars = cars.where(["description LIKE ?", "%#{keywords}%"]) if keywords.present?
		cars = cars.where(["transmission LIKE ?", transmission]) if transmission.present?
		cars = cars.where(["transmission LIKE ?", category]) if category.present?

		return cars

	end
	
end
