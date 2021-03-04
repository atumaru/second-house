class EventAddsController < ApplicationController

  def index
    

    @event = Event.find(params[:id])
    @like = current_user.likes.new(event_id: @event.id)
 
    
    @likes = Like.where(event_id: @event.id)
  end
end
