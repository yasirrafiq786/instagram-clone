Rails.application.routes.draw do
  devise_for :users

  root to: "pictures#index"

  resources :pictures, except: :index do
    resources :comments, only: [:create, :edit, :update, :delete]
  end
end
