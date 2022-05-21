Rails.application.routes.draw do
  resources :platforms
  resources :occasions
  resources :types
  resources :statuses
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
