Rails.application.routes.draw do

  	
  resources :cart_items
  resources :carts
  resources :sellers
  resources :searches
  devise_for :users , controllers: {
  	registrations: 'registrations'
  }
  root 'sellers#index'   #store..earlier

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
