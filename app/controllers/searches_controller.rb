class SearchesController < ApplicationController

  def search
    @item = Item.looks(params[:word])
    @items = @item.where(user_id: current_user.id)
  end
end
