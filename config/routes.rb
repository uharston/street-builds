Rails.application.routes.draw do

  resources :pins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :boards
  resources :cars, only: %i[index new create show] do 
    post '/pins', to: 'pins#create'
    resources :pins
  end 
  resources :users, only: %i[show]


  root 'welcome#home'
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'
  # get '/users', to: 'users#show', as: 'user'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback' => 'sessions#omniauth'

end
