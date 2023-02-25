class Customer::RecruitsController < ApplicationController
  before_action :authenticate_customer!, except:[:index]
  def new
    @recruit = Recruit.new
  end

  def create
    @recruit = Recruit.new(recruit_params)
    @recruit.customer_id = current_customer.id
    if @recruit.save
      redirect_to recruits_path
    else
      render :new
    end
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
    @recruit = Recruit.find(params[:id])
    if @recruit.update(recruit_params)
      redirect_to recruit_path
    else
      render :edit
    end
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
