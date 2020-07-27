Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :builds, only: %i[index new create show]
  root 'welcome#home'
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'
  get '/users', to: 'users#show'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback' => 'sessions#omniauth'

end
