class Customer::RecruitsController < ApplicationController
  def new
    @recruit = Recruit.new
  end
  
  def create
    recruit = Recruit.new
    recruit.save
  end 
  
  def index
    @recruit = Recruit.all
    @customer = Customer.all
    @genre = Genre.all
  end
  
  def show
    @recruit = Recruit.find(params[:id])
  end
  
  def edit
    @recruit = Recruit.find(params[:id])
  end
  
  def update
    recruit = Recruit.find(params[:id])
    recruit.update
  end
  
  private
  def recruit_params
    params.require(:recruit).permit(:school_name, :recruit_text, :name, :genre_id)
  end
end
