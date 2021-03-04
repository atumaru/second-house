class Event < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :prefecture
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  with_options presence: true do
    validates :title
    validates :content
    validates :start_time
    validates :prefecture_id
  end
end
