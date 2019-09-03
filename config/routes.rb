Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/dashboard', to: 'dashboard#show', as: :dashboard

  get '/signup', to: 'users#new', as: :signup
  resources :users, only: [:create]
end
