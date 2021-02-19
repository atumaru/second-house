class TweetsController < ApplicationController
  before_action :authenticate_user!, only: %i[ new create]

def index
  @tweets = Tweet.all
  
  

end
def new
  @tweet = Tweet.new
end
def create
  @tweet = Tweet.create(tweet_params)
  if @tweet.save
    redirect_to tweet_path(current_user.id)
  else
    render :new
  end

end

def show
  
  
  
end

private

def tweet_params
  params.require(:tweet).permit(:title,:text,:image).merge(user_id: current_user.id,prefecture_id: current_user.prefecture_now_id)
end
end
