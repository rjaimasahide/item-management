class StoragesController < ApplicationController

  def index
    @storages = Storage.all
  end

  def show
    @storage = Storage.find(params[:id])
  end

  def new
    @storage = Storage.new
  end

  def create
    @storage = Storage.new(storage_params)
    @storage.save
    redirect_to storages_path
  end

  def destroy
    @storage = Storage.find(params[:id])
    @storage.destory
  end


  private

  def storage_params
    params.require(:storage).permit(:name)
  end
end

