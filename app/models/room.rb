class Room < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :room_users
  has_many :users, through: :room_users
  has_many :messages
  belongs_to :prefecture

  validates :name, presence: true

  def self.search(search)
    if search != ''
      Room.where('name LIKE(?)', "%#{search}%")
    else
      Room.all
    end
  end
end
