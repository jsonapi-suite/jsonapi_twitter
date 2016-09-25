class TweetSerializer < ApplicationSerializer
  attributes :content, :date

  link(:self) { tweet_url(object.id) }

  belongs_to :author do
    link(:related) { users_url(filter: { id: object.author_id }) }
  end

  belongs_to :parent do
    link(:related) do
      if object.retweet?
        tweet_url(object.parent_id)
      end
    end
  end

  has_many :retweets do
    link(:related) do
      unless object.retweet?
        tweets_url(filter: { parent_id: object.id })
      end
    end
  end

  def date
    object.created_at
  end
end
