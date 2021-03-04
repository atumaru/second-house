class RemoveFavoriteCounFromTweets < ActiveRecord::Migration[6.0]
  def change
    remove_column :tweets, :Favorite_count, :integer
  end
end
