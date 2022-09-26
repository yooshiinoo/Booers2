Rails.application.routes.draw do

  root to: "homes#top"
  get "/homes/about" => "homes#about", as: "about"
  resources :books, only: [:index, :show, :edit]
  resources :users, only: [:index, :show, :edit]

  devise_for :users

end
