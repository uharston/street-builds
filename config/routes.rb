Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'welcome#home'
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback' => 'sessions#omniauth'
  
  resources :users, only: %i[show] do 
    resources :boards, only: %i[index show]
  end
  # resources :pins
  resources :boards
  resources :cars, only: %i[index new create show] do 
    post '/pins', to: 'pins#create'
    resources :pins
  end 




end
