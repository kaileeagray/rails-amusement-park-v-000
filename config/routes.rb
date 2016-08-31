Rails.application.routes.draw do
  root to: "welcome#home"

  resources :users

  resources :attractions

  get '/signin', to: 'sessions#new', as: 'signin'

  post '/signin' => 'sessions#create'

  delete '/signout', to: 'sessions#destroy', as: 'signout'

  post '/users/:id', to: 'rides#create'

end
