class Customer::MessagesController < ApplicationController
  before_action :authenticate_customer!
  def show
    @customer = Customer.find(params[:id])
    rooms = current_customer.customer_rooms.pluck(:room_id)
    customer_rooms = CustomerRoom.find_by(customer_id: @customer.id, room_id: rooms)
    unless customer_rooms.nil?
      @room = customer_rooms.room
    else
      @room = Room.new
      @room.save
      CustomerRoom.create([{:customer_id => @current_customer.id, :room_id => @room.id}, {:customer_id => @customer.id, :room_id => @room.id}])
    end
    @messages = @room.messages
    @message = Message.new(room_id: @room.id)
    render("customer/messages/message_form")
  end
  
  def create
    @message = current_customer.messages.new(message_params)
    if @message.save
      redirect_to request.referer
    else
      flash[:notice] = "※空欄では送信できません"
      redirect_to request.referer
    end
    
      
    
  end
  
  private
  def message_params
    params.require(:message).permit(:message, :room_id)
  end
end
