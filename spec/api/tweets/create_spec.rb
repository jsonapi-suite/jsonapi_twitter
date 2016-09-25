require 'rails_helper'

RSpec.describe 'tweets#create', type: :request do
  let!(:user) { User.create!(name: 'u', email: 'u@u.com') }

  let(:params) do
    {
      data: {
        type: 'tweets',
        attributes: { content: 'tweet 1' },
        relationships: {
          author: {
            data: {
              type: 'users',
              id: user.id
            }
          }
        }
      }
    }
  end

  it "adds to the user's tweets" do
    expect {
      post '/api/tweets', params: params
    }.to change { user.reload.tweets.count }.by(1)

    expect(response.status).to eq(200)
    assert_payload(:tweet, Tweet.last, json_item)
    assert_payload(:user, user, json_include('users'))
  end
end
