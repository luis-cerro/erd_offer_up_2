Rails.application.routes.draw do
  root :to => "categories#index"
  resources :items
  resources :transactions
  resources :statuses
  devise_for :users
  resources :users
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
