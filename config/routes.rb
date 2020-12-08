Rails.application.routes.draw do 
  devise_for :users
  root to: "chefs#index"
  resources :chefs do
   resources :request_chef, only: [:index, :create]
  end
end
