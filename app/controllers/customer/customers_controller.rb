class Customer::CustomersController < ApplicationController
  
 def index
 end
 
 def edit
 end
 
 def update
 end
 
 def show
 end
 
 def customer_params
    params.require(:customer).permit(:name, :name_kana, :name_kana, :phone_number, :email)
 end
end
