class Contact < ActiveRecord::Base
	validates :name, presence: true
	validates :phone, presence: true
  validates :email, presence: true, format: /@/
  validates :message, presence: true
end