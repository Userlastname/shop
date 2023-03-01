Rails.application.routes.draw do
  root 'home#index'
  resources :products
  resources :categories
  resources :carts
  resources :orders
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  post 'carts/:id/reduce', to: "carts#reduce_quantity", as: "reduce_qunt"
  post 'carts/:id/add', to: "carts#add_quantity", as: "add_qunt"
  delete "carts/:id", to: "carts#destroy", as: "destroy_item"
end
