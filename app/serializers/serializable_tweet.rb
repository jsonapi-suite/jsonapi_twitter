class SerializableTweet < JSONAPI::Serializable::Resource
  type 'tweets'

  attribute :content
  attribute :date do
    @object.created_at
  end

  link(:self) { @url_helpers.tweet_url(@object.id) }

  belongs_to :author do
    link(:related) { @url_helpers.users_url(filter: { id: @object.author_id }) }
  end

  belongs_to :parent do
    link(:related) do
      if @object.retweet?
        @url_helpers.tweet_url(@object.parent_id)
      end
    end
  end

  has_many :retweets do
    link(:related) do
      unless @object.retweet?
        @url_helpers.tweets_url(filter: { parent_id: @object.id })
      end
    end
  end
end
