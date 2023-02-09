Rails.application.routes.draw do
  root 'home#index'
  resources :products
  resources :categories
  resources :carts
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  post 'cart_products/:id/reduce' => "cart_products#reduce_quantity", as: "cart_item_reduce"
  post 'cart_products/:id/add' => "cart_products#add_quantity", as: "cart_item_add"
  delete "cart_products/:id" => "cart_products#destroy_item", as: "destroy_item"
  post 'cart_products' => "cart_products#create", as: "add_item"
end
