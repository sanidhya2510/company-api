Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "companies#index"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "/companies", to: "companies#index"
  resources :companies, only: [:index, :show, :new, :create]
  get '/logout_and_redirect', to: 'logout#logout_and_redirect', as: :logout_and_redirect

  # Defines the root path route ("/")
  # root "posts#index"
end
