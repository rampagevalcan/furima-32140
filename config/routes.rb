Rails.application.routes.draw do
  devise_for :users

  get 'items/index'
  root to: "items#index"
  get 'items/search'
  resources :items do
    resources :purchase_records, only: [:index, :create]
  end
end
