Rails.application.routes.draw do
  resources :tanks
  resources :colors
  resources :species
  resources :types
  resources :livestocks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
