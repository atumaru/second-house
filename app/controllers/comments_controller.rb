class CommentsController < ApplicationController

  def create
    
    
    @comment = Comment.new(comment_params)
    
    if @comment.save
      redirect_to root_path
    else
      @tweet = @comment.tweet
      @comments = @tweet.comments
      render "#"
    end

  end

 

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
  


end
