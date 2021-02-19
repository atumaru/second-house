class AddPrefectureToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :prefecture_id, :integer
  end
end
