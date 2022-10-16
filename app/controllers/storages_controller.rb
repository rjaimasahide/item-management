class StoragesController < ApplicationController

  def index
    @storages = Storage.where(user_id: current_user.id)
    @member = Member.new
    @members = Member.where(user_id: current_user.id)
  end

  def show
    @storage = Storage.find(params[:id])
    @items = Item.list(params[:order], @storage.id)
  end

  def new
    @storage = Storage.new
  end

  def edit
    @storage = Storage.find(params[:id])
  end

  def create
    @storage = Storage.new(storage_params)
    @storage.user_id = current_user.id
    @storage.save
    redirect_to storages_path
  end

  def update
    @storage = Storage.find(params[:id])
    @storage.user_id = current_user.id
    @storage.update(storage_params)
    redirect_to storage_path(@storage)
  end

  def destroy
    @storage = Storage.find(params[:id])
    @storage.destroy
    redirect_to storages_path
  end


  private

  def storage_params
    params.require(:storage).permit(:name)
  end
end

