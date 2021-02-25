class Event < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :prefecture

  with_options presence: true do
    validates :title
    validates :content
    validates :start_time
    validates :prefecture_id
  end
end
