Rails.application.routes.draw do
  resources :stock_types
  resources :tanks
  resources :colors
  resources :species
  resources :livestocks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
