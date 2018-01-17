Rails.application.routes.draw do
  resources :words do
    collection do
      get :match
    end
  end

  root 'words#index'
end
