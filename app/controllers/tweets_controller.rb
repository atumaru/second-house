class TweetsController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create]
  before_action :set_search_id,      only: %i[new create show edit update search]
  before_action :set_tweet_id,       only: %i[show edit update destroy move_to_show]
  before_action :move_to_show,       only: %i[edit destroy]

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
      redirect_to prefecture_tweets_path(id: current_user.prefecture_now_id)
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def edit
  end

  def update
    if
      @tweet.update(tweet_params)
      redirect_to tweet_path(@tweet)
    else
      render :edit
    end
  end

  def search
  end

  def destroy
    redirect_to prefecture_tweets_path(id: current_user.prefecture_now_id) if @tweet.destroy
  end

  private

  def move_to_show
    redirect_to prefecture_tweets_path(id: current_user.prefecture_now_id) if current_user.id != @tweet.user_id
  end

  def set_tweet_id
    @tweet = Tweet.find(params[:id])
  end

  def set_search_id
    @p = Tweet.ransack(params[:q])
    @results = @p.result
  end

  def tweet_params
    params.require(:tweet).permit(:title, :text, :image).merge(user_id: current_user.id, prefecture_id: current_user.prefecture_now_id)
  end
end
