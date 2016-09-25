class TweetsController < ApplicationController
  jsonapi do
    allow_filter :id
    allow_filter :author_id
    allow_filter :parent_id

    includes whitelist: { index: :author }
  end

  def index
    tweets = Tweet.all
    render_ams(tweets)
  end

  def show
    tweet = jsonapi_scope(Tweet.all).find(params[:id])
    render_ams(tweet)
  end
end
