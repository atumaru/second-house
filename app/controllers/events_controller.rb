class EventsController < ApplicationController
  
  def index
    now_id = current_user.prefecture_now_id
    @events = Event.where(prefecture_id: now_id)
   

    
  end
  
  def new
    @event = Event.new
  end
  def create

    
    if Event.create(event_parameter)
    redirect_to events_path
    else
    render :new
    end
    
  end

  def show
    @event = Event.find(params[:id])
  end
  private


  def event_parameter
    params.require(:event).permit(:title, :content, :start_time).merge(user_id:current_user.id,prefecture_id:current_user.prefecture_now_id)
  end

end

