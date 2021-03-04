class AddLikesCountToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :likes_count, :integer
  end
end
