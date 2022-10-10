Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :storages, only: [:new, :show, :index, :create, :destroy]

  resources :items, only: [:new, :edit, :create, :destroy, :update]

  resources :favorites, only: [:index, :edit, :new, :create, :destroy, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
