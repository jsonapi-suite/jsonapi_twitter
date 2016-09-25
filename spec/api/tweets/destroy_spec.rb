require 'rails_helper'

RSpec.describe 'tweets#destroy', type: :request do
  let!(:user) { User.create!(name: 'u', email: 'u@u.com') }
  let!(:tweet) { user.tweets.create!(content: 'tweet') }

  it 'deletes the tweet' do
    expect {
      delete "/api/tweets/#{tweet.id}"
    }.to change { Tweet.count }.from(1).to(0)
    expect(response.status).to eq(200)
    expect { tweet.reload }.to raise_error(ActiveRecord::RecordNotFound)
    assert_payload(:tweet, tweet, json_item)
  end
end
