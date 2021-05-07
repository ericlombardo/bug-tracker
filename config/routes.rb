Rails.application.routes.draw do
  root "sessions#welcome" # user selects if client or employee

  # routes for client login and signup
  get '/client/login', to: "sessions#client_new"  
  post '/client/login', to: "sessions#create"
  get '/client/signup', to: "users#client_new"
  post '/client/signup', to: "users#create"

  # routes for employee login and signup
  get '/employee/login', to: "sessions#employee_new"
  post '/employee/login', to: "sessions#create"
  get '/employee/signup', to: "users#employee_new"
  post '/employee/signup', to: "users#create"

  # route for omniauth callback
  match '/auth/:provider/callback', to: 'sessions#omniauth', via: [:get, :post]

  # route for user logout
  post '/logout', to: "sessions#destroy"

  # route for employee search feature
  post 'users/search', to: "users#search", via: :post
  get 'users/search', to: "users#index"

  resources :users do
    resources :programs, only: [:index]
    resources :bugs, only: [:index]
    resources :tasks
  end
  resources :programs do
    resources :bugs
  end

  # catch all that excludes active storage calls
  get '*all', to: 'sessions#welcome', constraints: lambda { |req|
  req.path.exclude? 'rails/active_storage'
}

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# found fix to catch all https://github.com/rails/rails/issues/31228
end
