Rails.application.routes.draw do

  # get 'splash/index'
  devise_for :users, controllers: { registrations: "registrations" }
  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :category 
  resources :transaction
  # Defines the root path route ("/")
  root to: "category#index"
end
