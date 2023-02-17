class Customer::CustomersController < ApplicationController

  def edit
   @customer = Customer.find(params[:id])
  end

  def update
   @customer = Customer.find(params[:id])
   @customer.update(customer_params)
   redirect_to customer_path(current_customer.id)
  end

  def show
     @name = current_customer.name
     @name_kana = current_customer.name_kana
     @phone_number = current_customer.phone_number
     @email = current_customer.email
     @school_name = current_customer.school_name
     @customer = Customer.find(params[:id])
  end

 # def favorites
 #  favorites = Favorite.where(customer_id: @customer.id).pulck(recruit_id)
 #  @favorite_recruits = Recruit.find(favorites)
 # end
 private

  def customer_params
     params.require(:customer).permit(:name, :name_kana, :name_kana, :phone_number, :email, :school_name, :comment)
  end
  
  # def set_user
  #   @customer = Customer.find(params[:id])
  # end
end
