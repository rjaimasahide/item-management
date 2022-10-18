class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
  end

  def index
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

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.save
    redirect_to storage_path(@item.storage_id)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to storages_path
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to storage_path(@item.storage_id)
  end

  private

  def item_params
    params.require(:item).permit(:name, :storage_id, :user_id, :comment, :image_id, :amount, :deadline, :owner, :deleted_at, :purchase_status)
  end
end
