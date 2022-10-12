class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.all
  end

  def show
    @favorite = Favorite.find(params[:id])
    storage = @favorite.storage_id
    @storage = Storage.find(storage)
    @item = Item.new
  end

  def edit
    @favorite = Favorite.find(params[:id])
  end

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.save
    redirect_to favorites_path
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to favorites_path
  end

  def update
    @favorite = Favorite.find(params[:id])
    @favorite.update(favorite_params)
    redirect_to favorite_path(@favorite)
  end


  private

  def favorite_params
    params.require(:favorite).permit(:name, :storage_id, :comment, :image_id, :amount, :deadline, :owner, :purchase_status)
  end
end
