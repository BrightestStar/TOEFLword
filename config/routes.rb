Rails.application.routes.draw do
  devise_for :users
  resources :words do
    collection do
      get :match
      get :renew_word
    end
    member do
      post :check_up
    end
  end

  resources :units

  root 'words#index'
end
