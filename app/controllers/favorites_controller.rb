class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.all
  end
  
  def show
    @favorite = Favorite.find(params[:id])
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

  def destory
    @favorite = Favorite.find(params[:id])
    @favorite.destory
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
