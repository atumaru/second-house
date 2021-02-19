class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
extend ActiveHash::Associations::ActiveRecordExtensions

with_options presence: true do
  validates :nickname
  validates :password, length: { minimum: 6 }
 
  validates :email, uniqueness: true
end
with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
  validates :last_name
  validates :first_name
end

VALID_PASSWORD_REGEX = VALID_PASSWORD_REGEX = /\A(?=.*?[A-z])(?=.*?[\d])[A-z\d]+\z/.freeze
validates :password, format: { with: VALID_PASSWORD_REGEX }

with_options presence: true, numericality: { other_than: 1 } do
 validates :prefecture_id
  validates :prefecture_now_id
end


has_many :room_users   
has_many :rooms, through: :room_users  
belongs_to :prefecture  
belongs_to :prefecture_now
has_many :messages 
has_many :tweets


end
