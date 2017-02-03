class TweetResource < ApplicationResource
  type :tweets

  allow_filter :id
  allow_filter :author_id
  allow_filter :parent_id

  belongs_to :author,
    foreign_key: :author_id,
    scope: -> { User.all },
    resource: UserResource
  belongs_to :parent,
    foreign_key: :parent_id,
    scope: -> { Tweet.all },
    resource: TweetResource
end
