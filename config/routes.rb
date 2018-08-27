require 'sidekiq/web'


Rails.application.routes.draw do

   resources :conversations do   #every convo has a msg..routes will be convo/msg/id/create
    resources :messages
  end

  resources :cart_items
  resources :carts
  resources :sellers do   #each seller item has/may have comments
    resources :comments
  end
  resources :searches
  
  devise_for :users , controllers: {
  	registrations: 'registrations'
  }
  root 'sellers#index'   #store..earlier

resources :ratings, only: :update


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
