Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/register', to: 'registration#new', as: :send_registration
  get '/verification/:id', to: 'item_verification#new', as: :send_item_verification
  get '/dashboard', to: 'users#show', as: :dashboard

  get '/signup', to: 'emails#new', as: :new_email
  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create', as: :logged_in
  get '/logout', to: 'sessions#destroy', as: :logout
  get '/activation/:code', to: 'activation#create', as: :activation

  get '/auth/facebook/callback', to: 'facebooks#create'
  get '/auth/google_oauth2/callback', to: 'googles#create'
  get '/auth/instagram/callback', to: 'instagrams#create'


  resources :users, only: [:create]
  resources :restaurants
  resources :emails, only: :create
  resources :items, only: [:show]

  resources :restaurants, only: [:show]

  resources :search, only: [:index]

  resources :items do
    collection do
      get :autocomplete
    end
  end

  namespace :default do
    resources :items do
      resources :reviews, only: [:new, :create]
    end

    resources :restaurants do
      resources :items, only: [:new, :create]
    end
  end

  match '*path', to: 'welcome#index', via: :all
end
