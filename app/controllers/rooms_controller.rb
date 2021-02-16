class RoomsController < ApplicationController
  def index
    @rooms = Room.all.order(:id)
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
  end
  
  def new
    
    @room = Room.new
  end

  def create
    
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path(current_user.prefecture_now_id)
    else
      render :new
    end

  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end

  

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end

end

