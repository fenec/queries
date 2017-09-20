Rails.application.routes.draw do
  resources :queries, only: [:index, :create]
  root to: "queries#index"
end
