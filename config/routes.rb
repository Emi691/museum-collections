Rails.application.routes.draw do
  resources :pieces
  get "/", to: "application#home"

  get "/signup", to: "users#new"
  post '/signup', to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "users#logout"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
