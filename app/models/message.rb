class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_one_attached :image
  validates :content, presence: true
  # after_create_commit { MessageBroadcastJob.perform_later self }
end
