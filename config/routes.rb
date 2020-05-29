Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  
  # Heroku needs this to be like this
  root to: 'welcome#index'

  resources :gigs
  resources :bands
  resources :users

  resources :carts, only: [:create, :index]

  get "/payments/session", to: "payments#get_stripe_id"
  get "/payments/success", to: "payments#success"

end
