Rails.application.routes.draw do
  resources :apts, only: [:show, :create, :destroy]
  resources :users

  resources :sessions
  resources :getautocompletes, only: [:show]

  resources :amenities, only: [:create]

end
