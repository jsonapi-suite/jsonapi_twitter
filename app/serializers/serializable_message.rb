class SerializableMessage < JSONAPI::Serializable::Resource
  type 'messages'

  attribute :content
  attribute :date do
    @object.created_at
  end

  link(:self) { @url_helpers.message_url(@object.id) }

  belongs_to :sender do
    link(:related) { @url_helpers.user_url(@object.sender_id) }
  end

  belongs_to :receiver do
    link(:related) { @url_helpers.user_url(@object.receiver_id) }
  end
end
