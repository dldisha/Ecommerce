Rails.application.routes.draw do

  	resources :chats
  resources :cart_items
  resources :carts
  resources :sellers do
    resources :comments
  end
  resources :searches
  
  devise_for :users , controllers: {
  	registrations: 'registrations'
  }
  root 'sellers#index'   #store..earlier

  mount ActionCable.server => "/cable"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
