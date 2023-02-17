class Admin::CommentsController < ApplicationController
  
  def index
    @recruit_comments = RecruitComment.all
  end
  
  def destroy
    RecruitComment.find(params[:id]).destroy
    redirect_to admin_comments_path
  end
end
