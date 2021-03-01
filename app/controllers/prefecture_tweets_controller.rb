class PrefectureTweetsController < ApplicationController
  def index
    @id = params[:id]
    @name = params[:name]

    @p =Tweet.ransack(params[:q])  
    @results = @p.result
  
    @prefecture_tweets = Tweet.where(prefecture_id: @id)
   
    if @prefecture_tweet.present?
      @tweet = Tweet.find(params[:id])
    end
    
    
  end
end
