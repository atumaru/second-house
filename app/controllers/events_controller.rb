class EventsController < ApplicationController
  
  def index
    now_id = current_user.prefecture_now_id
    @events = Event.where(prefecture_id: now_id)
    end
  
  def new
    @event = Event.new
  end
  def create
    
    @event = Event.create(event_params)
    
    if @event.save
    redirect_to events_path
    else
    render :new
    end
    
  end

  def show
    @event = Event.find(params[:id])
    @like = current_user.likes.new(event_id: @event.id)
   @likes = Like.where(event_id: @event.id)
  end


  def edit
   
  
    @event = Event.find(params[:id])
  end
  
  def update
   
  
    @event = Event.find(params[:id])
    if 
      @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      redirect_to events_path
    end
  end


  private


  def event_params
    params.require(:event).permit(:title, :content, :start_time).merge(user_id:current_user.id,prefecture_id:current_user.prefecture_now_id)
  end

end

