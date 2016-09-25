class UserSerializer < ApplicationSerializer
  attributes :name, :email

  link(:self) { user_url(object.id) }

  has_many :tweets do
    link(:related) { tweets_url(filter: { author_id: object.id }) }
  end

  has_many :friends do
    link(:related) { users_url(filter: { friend_id: object.id }) }
  end

  has_many :sent_messages do
    link(:related) { messages_url(filter: { sender_id: object.id }) }
  end

  has_many :received_messages do
    link(:related) { messages_url(filter: { receiver_id: object.id }) }
  end
end
