class Tweet < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user
  belongs_to :prefecture

  with_options presence: true do
    validates :title
    validates :text
    validates :image
  end
end
