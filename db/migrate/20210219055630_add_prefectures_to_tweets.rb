class AddPrefecturesToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :prefecture_id, :integer
  end
end
