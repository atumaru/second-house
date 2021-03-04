class Tweet < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image

  belongs_to :user
  belongs_to :prefecture
 
  has_many :comments, dependent: :destroy
  with_options presence: true do
    validates :title
    validates :text
    validates :image
    validates :prefecture_id
  end

  def self.search(search)
    
    

    if search != ""
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end

end
