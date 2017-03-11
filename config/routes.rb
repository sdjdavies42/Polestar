Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'

	end

	root to: 'pages#home' 
	get 'about', to: 'pages#about'
	resources :contacts, only: :create
	get 'contact-us', to: 'contacts#new', as: 'new_contact'
	get 'cars' => 'cars#index', as: :cars
	resources :searches
	resources :cars
	resources :users do
		resource :profile
		resources :cars, shallow: true  
	end

end
