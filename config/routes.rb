Rails.application.routes.draw do

  resources :products do
    resources :reviews, only: [:show, :create, :destroy]
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  get 'logout' => 'sessions#destroy'
  get 'login' => 'sessions#new'
  get 'signup' => 'users#new'

  root 'products#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
