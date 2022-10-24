Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "search" => "searches#search"
  resources :storages, only: [:new, :edit, :show, :index, :create, :update, :destroy]

  resources :items, only: [:index, :show, :new, :edit, :create, :destroy, :update] do
    resources :item_comments, only: [:create, :destroy]
  end

  resources :members, only: [:create, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
