class Customer::RecruitCommentsController < ApplicationController
  before_action :is_matching_login_customer, only: [:edit, :destroy]
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

  def is_matching_login_customer
    customer_id = params[:id].to_i
    unless customer_id == current_customer.id
      redirect_to recruits_path
    end
  end
end
