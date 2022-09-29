Rails.application.routes.draw do

  root to: "homes#top"
  devise_for :users
  get "/homes/about" => "homes#about", as: "about"
  resources :books, only: [:index, :create, :show, :edit, :destroy]
  
  resources :users, only: [:index, :show, :edit, :update]

 

end
