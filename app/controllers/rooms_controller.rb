class RoomsController < ApplicationController
  before_action :authenticate_user!, only: %i[index create new destroy] 
  
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


    @room = Room.find(params[:id])
    @messages = @room.messages
    if @message.present?
    @message = Message.find(params[:id])
    end
  end

  def search
    @rooms = Room.search(params[:keyword])
  end

  


  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end

  

  private

  
  def room_params
    params.require(:room).permit(:name).merge(prefecture_id:current_user.prefecture_now_id)
  end

end

