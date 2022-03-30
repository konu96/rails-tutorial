Rails.application.routes.draw do
  get 'sessions/new'

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
