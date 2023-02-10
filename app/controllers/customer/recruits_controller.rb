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
    @name = current_customer.name
    @name_kana = current_customer.name_kana
    @phone_number = current_customer.phone_number
    @email = current_customer.email
    @school_name = current_customer.school_name
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
    recruit.update(recruit_params)
    redirect_to recruit_path
  end

  private

  def recruit_params
    params.require(:recruit).permit(:school_name, :recruit_text, :name, :genre_id, :city_id)
  end
end
