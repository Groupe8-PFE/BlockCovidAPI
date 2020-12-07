Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    get '/bears', to: 'bears#index'
    get '/users', to: 'users#index'
    post '/login',    to: 'sessions#create'
    post '/logout',   to: 'sessions#destroy'
    get '/logged_in', to: 'sessions#is_logged_in?'
    resources :medecins, only: [:index, :create, :show, :destroy, :update]
    #resources :sessions, only: [:new, :create, :destroy]



  end




end

