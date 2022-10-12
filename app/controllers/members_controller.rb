class MembersController < ApplicationController
  
  def create
    @member = Member.new(member_params)
    @member.save
    redirect_to storage_path
  end
  
  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to storage_path
  end
  
  private
  
  def member_params
    params.require(:member).permit(:name)
  end
end
