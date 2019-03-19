Rails.application.routes.draw do
  root 'livestocks#index'
  get 'livestocks/bulk_new', to: 'livestocks#bulk_new'
  post 'livestocks/bulk_create', to: 'livestocks#bulk_create'
  resources :statuses
  resources :stock_types
  resources :tanks
  resources :colors
  resources :species
  resources :livestocks
  resources :histories
  
  match '*path' => redirect('livestocks#index'), via: :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
