class Customer::RecruitCommentsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @recruit_comment = RecruitComment.all
  end

  def create
    recruit = Recruit.find(params[:recruit_id])
    comment = current_customer.recruit_comments.new(recruit_comment_params)
    comment.recruit_id = recruit.id
    if comment.save
      redirect_to recruit_path(recruit)
    else 
      flash[:notice] = "※空欄では送信できません"
      redirect_to recruit_path(recruit)
    end
  end

  private

  def recruit_comment_params
    params.require(:recruit_comment).permit(:comment)
  end
end
