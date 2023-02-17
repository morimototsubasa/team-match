class Customer::RecruitCommentsController < ApplicationController
  
  def index
    @recruit_comment = RecruitComment.all
  end
  
  def create
    recruit = Recruit.find(params[:recruit_id])
    comment = current_customer.recruit_comments.new(recruit_comment_params)
    comment.recruit_id = recruit.id
    comment.save
    redirect_to recruit_path(recruit)
  end
  
  private

  def recruit_comment_params
    params.require(:recruit_comment).permit(:comment)
  end
end
