Rails.application.routes.draw do
  get "/users" => "users#index"
  post "/users" => "users#create"
  patch "/users/:id" => "users#update"
  delete "users/:id" => "users#destroy"

  post "/sessions" => "sessions#create"
  get "/user_info" => "users#info"
end
