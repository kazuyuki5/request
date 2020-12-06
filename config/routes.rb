Rails.application.routes.draw do 
  devise_for :users
  root to: "chefs#index"
  resources :chefs, only: [:index, :new, :create, :show, :edit, :update]
end
