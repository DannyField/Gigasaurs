Rails.application.routes.draw do
  devise_for :users
  root to: 'welcome#index'

  resources :gigs
  resources :bands
  resources :users

end
