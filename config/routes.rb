Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "home#show"
  get "/health_check", to: "home#health_check"
  get "/auth/:provider/callback", to: "sessions#create"
  get "/login", to: "sessions#new"
end
