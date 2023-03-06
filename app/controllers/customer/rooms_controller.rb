class Customer::RoomsController < ApplicationController
  def index
    # ログインユーザー所属ルームID取得
    current_customer_rooms = current_customer.customer_rooms
    my_room_id = []
    current_customer_rooms.each do |customer_room|
      my_room_id << customer_room.room.id
    end
    # 自分のroom_idでcustomer_idが自分じゃないのを取得
    @another_customer_rooms = CustomerRoom.where(room_id: my_room_id).where.not(customer_id: current_customer.id)
  end
end
