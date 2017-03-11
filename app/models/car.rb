class Car < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image,
										:styles => { :large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }
										
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	has_attached_file :image2,
										:styles => { :large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }
										
	validates_attachment_content_type :image2, content_type: /\Aimage\/.*\z/

	has_attached_file :image3,
										:styles => { :large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }
										
	validates_attachment_content_type :image3, content_type: /\Aimage\/.*\z/

	has_attached_file :image4,
										:styles => { :large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }
										
	validates_attachment_content_type :image4, content_type: /\Aimage\/.*\z/

	has_attached_file :image5,
										:styles => { :large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }
										
	validates_attachment_content_type :image5, content_type: /\Aimage\/.*\z/

	def self.search(search)
		if search
			where(["make like ?", "%#{search}%"])
		else
			all
		end
	end

end