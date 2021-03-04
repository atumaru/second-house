class LikesController < ApplicationController
  before_action :event_post

 

  def create
 
  @like = current_user.likes.new(event_id: @event.id)
 
  @like.save
 
  @likes = Like.where(evnet_id: @event.id)
 
  end
 
 
 
  def destroy
 
  @like = Like.find_by(event_id: @event.id, user_id: current_user.id).destroy
 
  @likes = Like.where(event_id: @event.id)
 
  end
 
 
 
  private
 
  def event_post
 
  @event = Event.find(params[:event_id])
 
  end
end
