Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "search" => "searches#search"
  resources :storages, only: [:new, :show, :index, :create, :destroy]

  resources :items, only: [:index, :show, :new, :edit, :create, :destroy, :update]

  resources :members, only: [:create, :destroy]

  resources :item_comments, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
