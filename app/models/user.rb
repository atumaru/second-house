class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
extend ActiveHash::Associations::ActiveRecordExtensions

has_many :room_users   
has_many :rooms, through: :room_users  
belongs_to :prefecture  
has_many :messages 
has_many :tweets
end
