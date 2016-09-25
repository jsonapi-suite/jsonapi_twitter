require 'rails_helper'

RSpec.describe 'tweets#update', type: :request do
  let!(:user) { User.create!(name: 'u', email: 'u@u.com') }
  let!(:tweet) { user.tweets.create!(content: 'initial') }

  let(:params) do
    {
      data: {
        id: tweet.id,
        type: 'tweets',
        attributes: { content: 'updated' },
      }
    }
  end

  it 'updates the tweet' do
    expect {
      put "/api/tweets/#{tweet.id}", params: params
    }.to change { tweet.reload.content }.from('initial').to('updated')

    expect(response.status).to eq(200)
    assert_payload(:tweet, tweet, json_item)
  end
end
