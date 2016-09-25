class MessageSerializer < ApplicationSerializer
  attributes :content, :date

  link(:self) { message_url(object.id) }

  belongs_to :sender do
    link(:related) { user_url(object.sender_id) }
  end

  belongs_to :receiver do
    link(:related) { user_url(object.receiver_id) }
  end

  def date
    object.created_at
  end
end
