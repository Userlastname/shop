Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'show', to: 'products#show'
  get 'home', to: 'home#index'
end
