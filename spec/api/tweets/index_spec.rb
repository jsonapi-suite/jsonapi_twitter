require 'rails_helper'

RSpec.describe 'tweets#index', type: :request do
  let!(:homer) { User.create!(name: 'Homer Simpson') }
  let!(:mr_burns) { User.create!(name: 'Mr. Burns') }
  let!(:tweet1) { homer.tweets.create!(content: 'tweet1') }
  let!(:tweet2) { mr_burns.tweets.create!(content: 'tweet2') }

  it 'lists tweets' do
    get '/api/tweets'
    expect(response.status).to eq(200)
    expect(json_items.length).to eq(2)
    assert_payload(:tweet, tweet1, json_items[0])
    assert_payload(:tweet, tweet2, json_items[1])
  end
end
