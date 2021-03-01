class TweetsController < ApplicationController
  before_action :authenticate_user!, only: %i[ new create]

def index
  
  @tweets = Tweet.all
  @prefectures = Prefecture.data
end

def new
  @tweet = Tweet.new
end

def create
   @tweet = Tweet.create(tweet_params)
   
  if @tweet.save
    redirect_to prefecture_tweets_path(current_user.prefecture_now_id)
  else
    render :new
  end
end

def show
  @tweet = Tweet.find(params[:id])
  @comment = Comment.new
  @comments = @tweet.comments.includes(:user)
  
end

def search
  @p =Tweet.ransack(params[:q])  
  @results = @p.result

end


private

def tweet_params
  params.require(:tweet).permit(:title,:text,:image).merge(user_id: current_user.id,prefecture_id: current_user.prefecture_now_id)
end
end
