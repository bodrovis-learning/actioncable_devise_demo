class ChatRoom < ApplicationRecord
  belongs_to :admin
  has_many :messages, dependent: :destroy

  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users

  def member?(user)
    users.include?(user) || owner?(user)
  end

  def owner?(user)
    admin == user
  end
end