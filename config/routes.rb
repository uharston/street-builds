Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'welcome#home'
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create', as: 'login_path'
  post '/logout', to: 'sessions#destroy'
  delete '/pins/:id', to: 'pins#destroy', as: 'delete_pin'
  delete '/cars/:id', to: 'cars#destroy', as: 'delete_car'
  delete '/boards/:id', to: 'boards#destroy', as: 'delete_board'
  get '/auth/:provider/callback' => 'sessions#omniauth'
  
  resources :pins
  resources :boards, only: %i[show edit update delete] do
    resources :pins, only: %i[ index ]
  end 

  resources :users, only: %i[show edit update] do 
    # resources :cars, only: %i[index]
    resources :boards, only: %i[index show]
  end

  resources :cars, only: %i[index new create show edit update] do 
    post '/pins', to: 'pins#create'
    resources :pins
  end 




end
