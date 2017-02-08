Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'

	end

 root to: 'pages#home' 
 get 'about', to: 'pages#about'
 resources :contacts, only: :create
 get 'contact-us', to: 'contacts#new', as: 'new_contact'

	resources :users do
		resource :profile
		resources :cars
	end
		
end
