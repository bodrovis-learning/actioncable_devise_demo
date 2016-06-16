class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages, dependent: :destroy
  has_many :owned_chat_rooms, class_name: 'ChatRoom', dependent: :destroy

  has_many :room_users, dependent: :destroy
  has_many :chat_rooms, through: :room_users
end
