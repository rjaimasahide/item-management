class StoragesController < ApplicationController

  def index
    @storages = Storage.where(user_id: current_user.id)
    @member = Member.new
    @members = Member.where(user_id: current_user.id)
    items = Item.where(user_id: current_user.id, purchase_status: true)
    @items = items.page(params[:page])
  end

  def show
    @storage = Storage.find(params[:id])
    items = Item.list(params[:order], @storage.id)
    @items = items.page(params[:page])
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
    if @storage.save
       redirect_to new_storage_path
    else
       flash[:danger] = @storage.errors.full_messages
       redirect_to new_storage_path
    end
  end

  def update
    @storage = Storage.find(params[:id])
    @storage.user_id = current_user.id
    if  @storage.update(storage_params)
        redirect_to edit_storage_path(@storage)
    else
        flash[:danger] = @storage.errors.full_messages
        redirect_to edit_storage_path(@storage)
    end
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

