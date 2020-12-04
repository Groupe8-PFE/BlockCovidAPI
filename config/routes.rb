Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    get '/bears', to: 'bears#index'
    get '/users', to: 'users#index'
  end
end
