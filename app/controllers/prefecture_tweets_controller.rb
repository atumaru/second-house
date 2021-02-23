class PrefectureTweetsController < ApplicationController
  def index
    @id = params[:id]
    @name = params[:name]
    
    # @tweet = Tweet.find(params[:id])
    
    # prefecture_id = @tweet.prefecture_id
    @prefecture_tweets = Tweet.where(prefecture_id: @id)
   
    
    
  end
end
