class MessageResource < ApplicationResource
  type :messages

  allow_filter :id
  allow_filter :sender_id
  allow_filter :receiver_id

  belongs_to :sender,
    foreign_key: :sender_id,
    scope: -> { User.all },
    resource: UserResource
  belongs_to :receiver,
    foreign_key: :receiver_id,
    scope: -> { User.all },
    resource: UserResource
end
