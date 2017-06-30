Rails.application.routes.draw do
  get 'sessions/new'

  get 'pages/home'
  get 'pages/perfil'
  get 'pages/troll'
  get 'pages/admin'
  get 'products/index'
  get 'products/condimentos'
  get 'products/cafedamanha'
  get 'products/carros'
  get 'products/findcategory'
  get 'products/addtocart'
  get 'products/search'
  get 'products/new'
  get 'carrinho/show' => 'carrinho#show'
  resources :categories
  resources :products
  resources :orders
  get 'orders/details/:id' => 'orders#detail'
  get 'carts/limpar'
  get 'carts/addtocart'
  get 'carts/aumentarqtd'
  get 'carts/diminuirqtd'
  get 'carts/destroy'
  post 'carts/destroy'
  get 'carts/remove'
  get 'carts/rise'
  get 'carts/low'
  post 'carts/rise'
  post 'carts/low'
  post 'carts/show' => 'carts#show'
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
