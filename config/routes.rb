Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :gyms, only: [:index, :show, :update, :create]
  resources :telephones
  resources :emails
  resources :states, only: [:index, :show, :update, :create]
  resources :cities, only: [:index, :show, :update, :create]
  resources :locations
  resources :plans, only: [:index, :show, :update, :create]
  resources :users, only: [:index, :show, :update, :create]
  resources :clients, only: [:index, :show, :update, :create]
  resources :admins, only: [:index, :show, :update, :create]
  resources :employees, only: [:index, :show, :update, :create]
end
