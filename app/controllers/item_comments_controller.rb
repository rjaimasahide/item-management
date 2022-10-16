class ItemCommentsController < ApplicationController

  def create
    @item_comment = ItemComment.new(item_comment_params)
    @item_comment.save
    redirect_to edit_item_path(@item_comment.item_id)
  end

  def destroy
    @item_comment = ItemComment.find(params[:id])
    @item_comment.destroy
    redirect_to edit_item_path(@item_comment.item_id)
  end

  private

  def item_comment_params
    params.require(:item_comment).permit(:comment, :item_id, :member_id)
  end

end
