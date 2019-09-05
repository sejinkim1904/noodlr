Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/register', to: 'registration#new', as: :send_registration
  get '/dashboard', to: 'users#show', as: :dashboard

  get '/signup', to: 'users#new', as: :new_user
  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create', as: :logged_in
  get '/logout', to: 'sessions#destroy', as: :logout
  get '/facebook/login', to: 'facebook/sessions#new', as: :facebook_login
  get '/gmail/login', to: 'gmail/sessions#new', as: :gmail_login

  resources :users, only: [:create]

  match '*path', to: 'welcome#index', via: :all
end
