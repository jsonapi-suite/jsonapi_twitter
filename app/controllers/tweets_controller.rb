class TweetsController < ApplicationController
  jsonapi do
    allow_filter :id
    allow_filter :author_id
    allow_filter :parent_id

    includes whitelist: { index: :author }
  end

  before_action :deserialize_jsonapi!, only: [:create, :update]

  strong_resource :tweet do
    belongs_to :author, resource: :user
  end

  def index
    tweets = Tweet.all
    render_ams(tweets)
  end

  def show
    tweet = jsonapi_scope(Tweet.all).find(params[:id])
    render_ams(tweet)
  end

  def create
    tweet = Tweet.new(strong_resource)

    if tweet.save
      render_ams(tweet)
    else
      render_errors_for(tweet)
    end
  end

  def update
    tweet = jsonapi_scope(Tweet.all).find(params[:id])

    if tweet.update_attributes(strong_resource)
      render_ams(tweet)
    else
      render_errors_for(tweet)
    end
  end

  def destroy
    tweet = jsonapi_scope(Tweet.all).find(params[:id])
    tweet.destroy
    render_ams(tweet)
  end
end
