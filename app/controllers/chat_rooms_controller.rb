class ChatRoomsController < ApplicationController
  def index
    
    now_id = current_user.prefecture_now_id
    @rooms = Room.where(prefecture_id: now_id)
    
   

  end

end
