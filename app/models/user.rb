class User < ApplicationRecord
  has_many :tweets, foreign_key: :author_id
  has_many :sent_messages, foreign_key: :sender_id, class_name: 'Message'
  has_many :received_messages, foreign_key: :receiver_id, class_name: 'Message'
  has_many :friendships, foreign_key: :friender_id
  has_many :friends,
    through: :friendships,
    source: :friendee

  def befriend(user)
    self.friends << user
    user.friends << self
    self
  end
end
