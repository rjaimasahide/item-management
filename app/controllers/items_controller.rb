class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
  end


  private

  def item_params
    params.require(:item).permit(:name, :storage_id, :comment, :image_id, :amount, :deadline, :owner, :purchase_status)
  end
end
