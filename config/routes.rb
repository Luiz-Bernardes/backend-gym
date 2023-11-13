Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :gyms, only: [:index, :show, :update, :create, :destroy]
      resources :telephones
      resources :states, only: [:index, :show, :update, :create]
      resources :cities, only: [:index, :show, :update, :create]
      resources :locations
      resources :plans
      resources :users, only: [:index, :show, :update, :create]
      resources :clients, only: [:index, :show, :update, :create]
      resources :admins, only: [:index, :show, :update, :create]
      resources :employees, only: [:index, :show, :update, :create]
      resources :exercises
      resources :records, only: [:index, :show, :update, :create] do
        resources :trainings
      end
      resources :training_exercises
    end
  end

end
