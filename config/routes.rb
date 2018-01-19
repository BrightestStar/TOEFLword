Rails.application.routes.draw do
  resources :words do
    collection do
      get :match
    end
    member do
      post :check_up
    end
  end

  root 'words#index'
end
