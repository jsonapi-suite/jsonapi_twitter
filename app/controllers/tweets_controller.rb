class TweetsController < ApplicationController
  jsonapi resource: TweetResource

  before_action :deserialize_jsonapi!, only: [:create, :update]

  strong_resource :tweet do
    belongs_to :author, resource: :user
  end

  def index
    tweets = Tweet.all
    render_jsonapi(tweets)
  end

  def show
    scope = jsonapi_scope(Tweet.where(id: params[:id]))
    render_jsonapi(scope.resolve.first, scope: false)
  end

  def create
    tweet = Tweet.new(strong_resource)

    if tweet.save
      render_jsonapi(tweet, scope: false)
    else
      render_errors_for(tweet)
    end
  end

  def update
    tweet = Tweet.find(params[:id])

    if tweet.update_attributes(strong_resource)
      render_jsonapi(tweet, scope: false)
    else
      render_errors_for(tweet)
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    render_jsonapi(tweet, scope: false)
  end
end
