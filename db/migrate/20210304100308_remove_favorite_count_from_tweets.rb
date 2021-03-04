class RemoveFavoriteCountFromTweets < ActiveRecord::Migration[6.0]
  def change
    remove_column :tweets, :likes_count, :integer
  end
end
