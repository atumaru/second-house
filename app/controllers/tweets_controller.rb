class TweetsController < ApplicationController
def index
  @tweets = Tweet.all
end
def new
  @tweet = Tweet.new
end
def create
  @tweet = Tweet.create(tweet_params)
  if @tweet.save
    redirect_to root_path
  end
end

private

def tweet_params
  params.require(:tweet).permit(:title,:text).merge(user_id: current_user.id)
end
end
