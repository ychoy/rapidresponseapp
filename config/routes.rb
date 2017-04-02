Rails.application.routes.draw do
  root to: 'users#index'

  ## SESSIONS ##
  get "/login", to: "sessions#new"

  get "/logout", to: "sessions#destroy"

  post "/sessions", to: "sessions#create"

  resources :users, except: [:index]

  get "/search/:id", to: "users#search", as: "search"

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
