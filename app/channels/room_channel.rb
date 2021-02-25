class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{params['room']}"
    stream_for current_user.id
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    if data["content"]
    Message.create! (
      content: data['message'], 
      user_id: current_user.id, 
      room_id: params['room']
    )
    
    RoomChannel.broadcast_to data["current_user_id"].to_i,
    content: data["message"],
    isCurrent_user: true

    RoomChannel.broadcast_to data["!current_user_id"].to_i,
        content: data["message"],
        isCurrent_user: false
   end
 end
end