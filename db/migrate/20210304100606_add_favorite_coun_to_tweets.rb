class AddFavoriteCounToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :Favorite_count, :integer
  end
end
