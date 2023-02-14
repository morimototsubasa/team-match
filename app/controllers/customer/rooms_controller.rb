class Customer::RoomsController < ApplicationController
  
  def index
    @rooms = current_customer.room
  end
end
