Rails.application.routes.draw do
  devise_for :users

  root "items#index"

  resources :items, only: [:new, :create, :index]
  
  #get 'items/:price', to: 'items#price'
end
