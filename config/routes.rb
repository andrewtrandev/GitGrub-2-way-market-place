Rails.application.routes.draw do

  devise_for :users
  #static routes above dynamic routes

  root to: "lunches#index"

  get "/lunches", to:"lunches#index", as:"lunches"
  #we need a get request, the path will be through root / and it'll be handled by the lunches controller by the index method

  get "/lunches/new", to:"lunches#new", as:"lunch_new"
  #renders a new form for create method at /lunches/new

  get "/lunches/:id", to:"lunches#show", as: "lunch"

  get "/lunches/:id/edit", to:"lunches#edit", as: "edit_lunch"

  post "/lunches", to:"lunches#create"

  delete "/lunches/:id", to:"lunches#destroy"

  patch "/lunches/:id", to:"lunches#update"


  get "/addresses", to:"addresses#show"

  

  get "/payments/success", to:"payments#success"

  post "/payments/webhook", to:"payments#webhook"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
