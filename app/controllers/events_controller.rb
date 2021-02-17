class EventsController < ApplicationController
  def index
    @events = Event.all
    
  end
  
  def new
    @event = Event.new
  end
  def create

    
    if Event.create(event_parameter)
    redirect_to chat_room_events_path
    else
    render :new
    end
    
  end

  def show
    @event = Event.find(params[:id])
  end
  private

  def event_parameter
    params.require(:event).permit(:title, :content, :start_time).merge(user_id:current_user.id)
  end

end

