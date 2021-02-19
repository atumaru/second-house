class Event < ApplicationRecord
  
  belongs_to :user
  belongs_to :prefecture

  with_options presence: true do
    validates :title
    validates :content
    validates :start_time
  end
end
