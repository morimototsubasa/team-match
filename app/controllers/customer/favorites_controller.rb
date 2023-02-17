class Customer::FavoritesController < ApplicationController
  
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
end