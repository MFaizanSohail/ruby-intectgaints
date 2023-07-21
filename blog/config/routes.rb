Rails.application.routes.draw do
  root "users#index"

  get "/users", to: "users#index"
  post "/users/create", to: "users#create"
  patch "/users/update", to: "users#update"
  get "/users/edit", to: "users#edit"
end
