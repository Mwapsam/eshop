Rails.application.routes.draw do
  resources :products
  resources :checkout, only: [:create]

  root "products#index"
end
