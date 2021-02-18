class MessagesController < ApplicationController
  def index
    @messages = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages
    
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to  room_messages_path(@room)
    else
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content,:image).merge(user_id: current_user.id)
  end
  
  end

