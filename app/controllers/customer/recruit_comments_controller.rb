class Customer::RecruitCommentsController < ApplicationController
  
  def create
    recruit = Recruit.find(params[:recruit_id])
    comment = current_customer.recruits.new(recruit_comment_params)
    comment.recruit_id = recruit.id
    redirect_to recruit_path(recruit)
  end
  
  private

  def recruit_comment_params
    params.require(:recruit_comment).permit(:comment)
  end
end
