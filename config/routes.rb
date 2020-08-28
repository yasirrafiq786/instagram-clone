Rails.application.routes.draw do
  devise_for :users

  root to: "pictures#index"

  resources :pictures, except: :index do
    resources :comments, only: [:create]
  end

  resources :comments, only: [:edit, :update, :destroy]
end
