require 'rails_helper'

RSpec.describe 'users#show', type: :request do
  let!(:user) { User.create!(name: 'Homer Simpson', email: 'chunkylover53@gmail.com') }

  it 'renders user' do
    get "/api/users/#{user.id}"
    expect(response.status).to eq(200)
    assert_payload(:user, user, json_item)
  end
end
