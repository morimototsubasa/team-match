class Customer::FavoritesController < ApplicationController
  before_action :is_matching_login_customer
  def index
     @customer = Customer.find(params[:customer_id])
     @favorites = Favorite.where(customer_id: @customer.id)
  end
  
  def create
    recruit = Recruit.find(params[:recruit_id])
    favorite = current_customer.favorites.new(recruit_id: recruit.id)
    favorite.save
    redirect_to recruit_path(recruit)
  end
  
  def destroy
    recruit = Recruit.find(params[:recruit_id])
    favorite = current_customer.favorites.find_by(recruit_id: recruit.id)
    favorite.destroy
    redirect_to recruit_path(recruit)
  end
  
  def is_matching_login_customer
    customer_id = params[:id].to_i
    unless customer_id == current_customer.id
      redirect_to recruits_path
    end
  end
end