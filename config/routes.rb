Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    get '/bears', to: 'bears#index'
    get '/users', to: 'users#index'
    resources :medecins, only: [:index, :create, :show, :destroy, :update]
    resources :etablissements, only: [:index, :create, :show, :destroy, :update] do
      resources :lieus, only: [:index, :create, :show, :destroy, :update]
    end
    resources :citoyens, only: [:create, :show]
    post '/loginMedecin', to: 'login_medecin#login'
    get '/authMedecin', to: 'login_medecin#persist'
    post '/loginEtablissement', to: 'login_etablissement#login'
    get '/authEtablissement', to: 'login_etablissement#persist'
  end

end
