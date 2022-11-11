Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "users" => "homes#top"
  get "search" => "searches#search"
  resources :storages, only: [:new, :edit, :show, :create, :update, :destroy]

  resources :items, only: [:show, :new, :edit, :create, :destroy, :update] do
    resources :item_comments, only: [:create, :destroy]
    get 'shopping_list', on: :collection
    get 'deleted_items', on: :collection
    post 'update_new', on: :collection
  end

  resources :members, only: [:create, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
