class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def dealer_location
    "#{profile.location}"
  end

  belongs_to :plan
  has_one :profile, :dependent => :destroy
  has_many :cars, :dependent => :destroy

  attr_accessor :stripe_card_token

  def save_with_subscription
  	if valid?
  		customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
  		self.stripe_customer_token = customer.id 
  		save!
  	end
  end
end
