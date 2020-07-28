Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do 
    post '/boards', to: 'boards#create'
    resources :boards
  end 
  resources :project_cars, only: %i[index new create show]
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
