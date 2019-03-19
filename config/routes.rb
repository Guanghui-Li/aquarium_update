Rails.application.routes.draw do
  resources :memos
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
  
  match '*a' => redirect { |p, req| req.flash[:danger] = "Wrong route, the page you are looking for does not exist"; '/' }, via: :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
