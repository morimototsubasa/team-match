class Admin::CustomersController < ApplicationController
  
  def index
    @customer = Customer.all
  end
  
  def show
     @customer = Customer.find(params[:id])
  end
  
  def retire
      customer = Customer.find(params[:customer_id])
      customer.update!(is_customer_status: true)
      redirect_to admin_customers_path
  end
  
end
