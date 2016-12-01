class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'

  attributes :name, :email

  link(:self) { @url_helpers.user_url(@object.id) }

  has_many :tweets do
    link(:related) { @url_helpers.tweets_url(filter: { author_id: @object.id }) }
  end

  has_many :friends do
    link(:related) { @url_helpers.users_url(filter: { friend_id: @object.id }) }
  end

  has_many :sent_messages do
    link(:related) { @url_helpers.messages_url(filter: { sender_id: @object.id }) }
  end

  has_many :received_messages do
    link(:related) { @url_helpers.messages_url(filter: { receiver_id: @object.id }) }
  end
end
