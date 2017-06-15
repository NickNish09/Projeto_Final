Rails.application.routes.draw do
  get 'sessions/new'

  get 'pages/home'
  get 'pages/perfil'
  get 'pages/troll'
  get 'products/index'
  get 'products/condimentos'
  get 'products/cafedamanha'
  get 'products/addtocart'
  get 'carts/addtocart'
  resources :carts,only: [:show]
  get 'users/new'
  resources :users

  get 'pages/home'
  root 'pages#home'
	get    'sign_in'   => 'sessions#new'
  post   'sign_in'   => 'sessions#create'
  delete 'sign_out'  => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
