class Customer::CustomersController < ApplicationController
 before_action :is_matching_login_customer
 
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
     @recruits = @customer.recruits
  end
  
 

 # def favorites
 #  favorites = Favorite.where(customer_id: @customer.id).pulck(recruit_id)
 #  @favorite_recruits = Recruit.find(favorites)
 # end
 private

  def customer_params
     params.require(:customer).permit(:name, :name_kana, :name_kana, :phone_number, :email, :school_name, :comment)
  end

  def is_matching_login_customer
    customer_id = params[:id].to_i
    unless customer_id == current_customer.id
      redirect_to recruits_path
    end
  end
  # def set_user
  #   @customer = Customer.find(params[:id])
  # end
end
