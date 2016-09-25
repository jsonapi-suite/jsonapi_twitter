require 'rails_helper'

RSpec.describe 'users#index', type: :request do
  let!(:user1) { User.create!(name: 'Homer Simpson', email: 'chunkylover53@hotmail.com') }
  let!(:user2) { User.create!(name: 'Mr. Burns', email: 'overlord@rnc.com') }

  it 'lists users' do
    get '/api/users'
    expect(response.status).to eq(200)
    expect(json_items.length).to eq(2)
    assert_payload(:user, user1, json_items[0])
    assert_payload(:user, user2, json_items[1])
  end
end
