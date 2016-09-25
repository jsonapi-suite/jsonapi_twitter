require 'rails_helper'

RSpec.describe 'tweets#show', type: :request do
  let!(:homer) { User.create!(name: 'Homer Simpson') }
  let!(:tweet) { homer.tweets.create!(content: 'my tweet') }

  it 'renders tweet' do
    get "/api/tweets/#{tweet.id}"
    expect(response.status).to eq(200)
    assert_payload(:tweet, tweet, json_item)
  end
end
