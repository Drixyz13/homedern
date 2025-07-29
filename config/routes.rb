Rails.application.routes.draw do
  get "orders/index"
  get "orders/show"
  get "users/show"
  root "pages#home"

  devise_for :users

  post "/stripe_checkout/create", to: "stripe_checkout#create", as: :stripe_checkout
  get "/stripe_checkout/success", to: "stripe_checkout#success", as: :success_stripe_checkout

  get '/faq', to: 'pages#faq'

  resources :orders, only: [:index, :show]
  resources :users, only: [:show]
  resources :products, only: [:index, :show]
  resources :orders, only: [:new, :create, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
