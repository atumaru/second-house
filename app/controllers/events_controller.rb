class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[index new create show edit update destroy]
  before_action :set_id,only: %i[show edit update destroy]
  before_action :move_to_index, only: %i[edit destroy]
  
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
    @like = current_user.likes.new(event_id: @event.id)
   @likes = Like.where(event_id: @event.id)
  end


  def edit

  end
  
  def update
    if 
      @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    if @event.destroy
      redirect_to events_path
    end
  end


  private

   def set_id
    @event = Event.find(params[:id])
   end


  def event_params
    params.require(:event).permit(:title, :content, :start_time).merge(user_id:current_user.id,prefecture_id:current_user.prefecture_now_id)
  end

  def move_to_index
    if current_user.id != @event.user_id
      redirect_to action: :index
    end
  end

end

