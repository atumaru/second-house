class PrefectureTweetsController < ApplicationController
  def index
    @id = params[:id]
    @name = params[:name]

    @p = Tweet.ransack(params[:q])
    @results = @p.result

    @prefecture_tweets = Tweet.where(prefecture_id: @id)

    @tweet = Tweet.find(params[:id]) if @prefecture_tweet.present?
  end
end
