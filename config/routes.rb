Rails.application.routes.draw do
  resources :products
  resources :checkout
  post "checkout/create", to: "checkout#create"
  get "success", to: "checkout#success"
  get "cancel", to: "checkout#cancel"

  root "products#index"
end
