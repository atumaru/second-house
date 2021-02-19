class AddPrefectureToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :prefecture_id, :integer
  end
end
