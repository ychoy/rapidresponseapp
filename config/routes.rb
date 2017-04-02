Rails.application.routes.draw do
  root to: 'users#index'
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  ## SESSIONS ##
  get "/login", to: "sessions#new"

  get "/logout", to: "sessions#destroy"

  post "/sessions", to: "sessions#create"

  resources :users, except: [:index]

  get "/search/:id", to: "users#search", as: "search"

  resources :conversations, except: [:edit, :update, :destroy]

  resources :messages, except: [:edit, :update, :destroy]

  get '/users/:user_id/conversations', to: 'memberships#index', as: 'users_memberships'
  post '/conversations/:conversation_id/users', to: 'memberships#create', as: 'memberships_users'
  delete '/conversations/:conversation_id/users', to: 'memberships#destroy', as: 'membership_destroy'

  resources :direct_messages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
