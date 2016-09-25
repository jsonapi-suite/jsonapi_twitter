require 'rails_helper'

RSpec.describe 'messages#show', type: :request do
  let!(:homer) { User.create!(name: 'Homer Simpson') }
  let!(:mr_burns) { User.create!(name: 'Mr. Burns') }
  let!(:message) { Message.create!(sender: homer, receiver: mr_burns, content: 'message1') }

  it 'renders message' do
    get "/api/messages/#{message.id}"
    expect(response.status).to eq(200)
    assert_payload(:message, message, json_item)
  end
end
