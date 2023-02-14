class Customer::RecruitsController < ApplicationController

  def new
    @recruit = Recruit.new
  end

  def create
    @recruit = Recruit.new(recruit_params)
    @recruit.customer_id = current_customer.id
    @recruit.save
    redirect_to recruits_path
  end

  def index
    @recruit = Recruit.all
    @customer = Customer.all
    @genre = Genre.all
  end

  def show
    @recruit = Recruit.find(params[:id])
    @recruit_comment = RecruitComment.new
  end

  def edit
    @recruit = Recruit.find(params[:id])
  end

  def update
    recruit = Recruit.find(params[:id])
    recruit.update(recruit_params)
    redirect_to recruit_path
  end
  
  def destroy
    recruit = Recruit.find(params[:id])
    recruit = destroy
    redirect_to recruits_path
  end
  private

  def recruit_params
    params.require(:recruit).permit(:school_name, :recruit_text, :name, :genre_id, :city_id)
  end
end
