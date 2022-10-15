class SearchesController < ApplicationController

  def search
    @item = Item.looks(params[:word],)
  end
end
