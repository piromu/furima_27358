Rails.application.routes.draw do
  
  devise_for :users
  root to: 'items#index'
  get "signup", to: "signup#index"
  resources :signup do
    collection do
      get 'complete_signup'
    end
  end

  resources :signin ,only: [:new, :create, :index]
  resources :signup, only: [:index, :new, :create]
  
  resources :item do
    resources :managements
  end
end
