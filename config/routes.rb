Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "users" => "homes#top"
  
  #検索機能
  get "search" => "searches#search"
  
  #タブ部分
  resources :storages, only: [:new, :edit, :show, :create, :update, :destroy]

  #アイテム部分
  resources :items, only: [:show, :new, :edit, :create, :destroy, :update] do
    resources :item_comments, only: [:create, :destroy]
    get 'shopping_list', on: :collection
    get 'deleted_items', on: :collection
    post 'update_new', on: :collection
  end

  #メンバー部分
  resources :members, only: [:create, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
