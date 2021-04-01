Rails.application.routes.draw do
  resources :pieces
  get "/", to: "application#home"

  get "/signup", to: "users#signup"
  get "/login", to: "users#login"
  get "/logout", to: "users#logout"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
