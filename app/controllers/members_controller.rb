class MembersController < ApplicationController

  def create
    @member = Member.new(member_params)
    @member.user_id = current_user.id
    if @member.save
       redirect_to storages_path
    else
       flash[:danger] = @member.errors.full_messages
       redirect_to storages_path
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to storages_path
  end

  private

  def member_params
    params.require(:member).permit(:name, :user_id)
  end
end
