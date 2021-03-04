class AddFavoriteCouToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :favorite_count, :integer
  end
end
