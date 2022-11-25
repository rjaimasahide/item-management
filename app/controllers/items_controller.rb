class ItemsController < ApplicationController
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy, :show]}

  def show
    @item = Item.find(params[:id])
    @item_new = Item.new
  end

  def deleted_items
    items = Item.where(deleted_at: true, user_id: current_user.id)
    @items = items.page(params[:page])
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
    @item_comments = ItemComment.where(item_id: @item)
    @item_comment = ItemComment.new
  end

  def shopping_list
    @storages = Storage.where(user_id: current_user.id)
    @member = Member.new
    @members = Member.where(user_id: current_user.id)
    items = Item.where(user_id: current_user.id, purchase_status: true)
    @items = items.page(params[:page])
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @storage_id = @item.storage_id
    if @item.save
       redirect_to storage_path(@item.storage_id)
    else
       flash[:danger] = @item.errors.full_messages
       redirect_to new_item_path(storage_id: @storage_id)
    end
  end

  def update_new
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @storage_id = @item.storage_id
    if @item.save
       redirect_to deleted_items_items_path
    else
       flash[:danger] = "タブを選択してください"
       redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to deleted_items_items_path
  end

  def all_destroy
    items = Item.where(user_id: current_user.id, deleted_at: true)
    items.destroy_all
    redirect_to deleted_items_items_path
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
       redirect_to storage_path(@item.storage_id)
    else
       flash[:danger] = @item.errors.full_messages
       redirect_to edit_item_path(@item.id)
    end
  end

  #閲覧できるユーザーの制限
  def ensure_correct_user
    @item = Item.find(params[:id])
    if @item.user_id !=  current_user.id
       redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :storage_id, :user_id, :comment, :image_id, :amount, :deadline, :owner, :deleted_at, :purchase_status)
  end
end
