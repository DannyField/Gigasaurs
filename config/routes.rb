Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :gigs
  resources :bands

end
