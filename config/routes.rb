Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root "users#index"

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  
  resources :users
  resources :movies do
  	resources :comments
  end
  get '/movies/like_me/:id', to: 'movies#like_me', as: 'like_me'
  get '/movies/dislike_me/:id', to: 'movies#dislike_me', as: 'dislike_me'
end
