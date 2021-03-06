class ChatRoomsController < ApplicationController
  before_action :authenticate_user!, only: %i[index search]

  def index
    now_id = current_user.prefecture_now_id
    @rooms = Room.where(prefecture_id: now_id)
  end

  def search
    now_id = current_user.prefecture_now_id
    @room = Room.search(params[:keyword])
    @rooms = @room.where(prefecture_id: now_id)
  end
end
