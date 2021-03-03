class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
extend ActiveHash::Associations::ActiveRecordExtensions

with_options presence: true do
  validates :nickname
  validates :password, length: { minimum: 6 },on: :create
 
  validates :email, uniqueness: true
end
with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
  validates :last_name
  validates :first_name
end

VALID_PASSWORD_REGEX = VALID_PASSWORD_REGEX = /\A(?=.*?[A-z])(?=.*?[\d])[A-z\d]+\z/.freeze
validates :password, format: { with: VALID_PASSWORD_REGEX },on: :create



validate :add_prefecture
validate :add_prefecture_id
validate :add_prefecture_now_id


has_many :room_users   
has_many :rooms, through: :room_users  
has_many :messages 
has_many :tweets
has_many :comments
belongs_to :prefecture  
belongs_to :prefecture_now

private

def add_prefecture

  if prefecture_id == prefecture_now_id
    errors.add(:prefecture_id, "出身地と現在のお住まいは違う県を選んでください")
  end
end

def add_prefecture_id
if prefecture_id == 1
errors.add(:prefecture_id, "出身地を選択してください")
end
end

def add_prefecture_now_id
  if prefecture_now_id == 1
  errors.add(:prefecture_now_id, "出身地を選択してください")
  end
  end


end
