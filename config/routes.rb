Rails.application.routes.draw do
  devise_for :users
  resources :words do
    collection do
      get :matching
      get :renew_word
      get :view_error_log
    end
    member do
      post :check_up
    end
  end

  resources :units

  root 'words#index'
end
