class UserResource < ApplicationResource
  type :users

  allow_filter :id
  allow_filter :name
  allow_filter :email
  allow_filter :name_prefix do |scope, value|
    scope.where(["name LIKE ?", "#{value}%"])
  end

  allow_filter :friend_id do |scope, value|
    scope.joins(:friendships).where(friendships: { friendee_id: value })
  end

  has_many :sent_messages,
    scope: -> { Message.all },
    foreign_key: :sender_id,
    resource: MessageResource
  has_many :received_messages,
    scope: -> { Message.all },
    foreign_key: :receiver_id,
    resource: MessageResource
end
