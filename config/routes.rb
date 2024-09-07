Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'languages#index'
  
  resources :languages do
  resources :likes, only: [:create, :destroy]
  resources :coments
  end
end