class TweetsController < ApplicationController
  before_action :authenticate_user!, only: %i[ new create]

def index
  
  @tweets = Tweet.all
  @prefectures = Prefecture.data
end

def new
  @p =Tweet.ransack(params[:q])  
  @results = @p.result
  @tweet = Tweet.new
  
end

def create
  @p =Tweet.ransack(params[:q])  
  @results = @p.result
   @tweet = Tweet.create(tweet_params)
   
  if @tweet.save
    redirect_to prefecture_tweets_path(id:current_user.prefecture_now_id)
  else
    render :new
  end
end

def show
  @p =Tweet.ransack(params[:q])  
  @results = @p.result
  @tweet = Tweet.find(params[:id])
  @comment = Comment.new
  @comments = @tweet.comments.includes(:user)
  
end

def edit
  @p =Tweet.ransack(params[:q])  
  @results = @p.result

  @tweet = Tweet.find(params[:id])
end

def update
  @p =Tweet.ransack(params[:q])  
  @results = @p.result

  @tweet = Tweet.find(params[:id])
  if 
    @tweet.update(tweet_params)
    redirect_to tweet_path(@tweet)
  else
    render :edit
  end

end

def search
  @p =Tweet.ransack(params[:q])  
  @results = @p.result

end

def destroy
  @tweet = Tweet.find(params[:id])
  if @tweet.destroy
    redirect_to prefecture_tweets_path(id:current_user.prefecture_now_id)
  end
end


private

def tweet_params
  params.require(:tweet).permit(:title,:text,:image).merge(user_id: current_user.id,prefecture_id: current_user.prefecture_now_id)
end
end
