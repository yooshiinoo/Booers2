Rails.application.routes.draw do

  root to: "homes#top"
  get "/homes/about" => "homes#about", as: "about"
  resources :books, only: [:index, :create, :show, :edit, :destroy]
  resources :users, only: [:index, :show, :edit, :update]

  devise_for :users

end
