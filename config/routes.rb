Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  root 'home#index'
  get 'show', to: 'products#show'
  get 'products', to: 'products#show'
  get 'cart', to: 'products#cart'
  get 'home', to: 'home#index'
end
