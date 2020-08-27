Rails.application.routes.draw do
  devise_for :users

  root to: "pictures#index"

  resources :pictures, except: :index
end
