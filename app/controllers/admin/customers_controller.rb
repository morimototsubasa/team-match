class Admin::CustomersController < ApplicationController
  def index
    @customer = Customer.all
  end
  
  def show
     @name = current_customer.name
     @name_kana = current_customer.name_kana
     @phone_number = current_customer.phone_number
     @email = current_customer.email
     @school_name = current_customer.school_name
     @customer = Customer.find(params[:id])
  end
  
  def edit
  end
  
  def update
  end
end
