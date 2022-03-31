Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'users/new'

  root 'static_pages#home'
  get 'static_pages/about'
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/cat'
  get 'static_pages/contact'

  get '/signup', to: 'users#new'

  resources :users
end
