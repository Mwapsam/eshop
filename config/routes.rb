Rails.application.routes.draw do
  devise_for :users
  resources :products
  resources :webhooks, only: [:create]
  post "checkout/create", to: "checkout#create"
  get "success", to: "checkout#success"
  get "cancel", to: "checkout#cancel"

  root "products#index"
  post "products/add_to_cart/:id", to: "products#add_to_cart", as: "add_to_cart"
  delete "products/remove_from_cart/:id", to: "products#remove_from_cart", as: "remove_from_cart"
end
