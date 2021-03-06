class RoomsController < ApplicationController
  before_action :authenticate_user!, only: %i[index show create new destroy]
  before_action :set_room_id,        only: %i[show destroy move_to_root]
  before_action :move_to_root, only: %i[show]
  def index
    @room = Room.new
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to chat_rooms_path(current_user.prefecture_now_id)
    else
      render new_room_path
    end
  end

  def show
    now_id = current_user.prefecture_now_id
    @rooms = Room.where(prefecture_id: now_id)

    @messages = @room.messages
    @message = Message.find(params[:id]) if @messages.present?
  end

  def search
    @rooms = Room.search(params[:keyword])
  end

  def destroy
    room.destroy
    redirect_to root_path
  end

  private

  def set_room_id
    @room = Room.find(params[:id])
  end

  def move_to_root
    redirect_to chat_rooms_path(current_user.prefecture_now_id) if current_user.prefecture_now_id != @room.prefecture_id
  end

  def room_params
    params.require(:room).permit(:name).merge(prefecture_id: current_user.prefecture_now_id)
  end
end
