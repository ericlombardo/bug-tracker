Rails.application.routes.draw do
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  resources :users, only: [:new, :create]
  resources :bugs
  resources :programs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
