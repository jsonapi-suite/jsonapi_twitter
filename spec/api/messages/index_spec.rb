require 'rails_helper'

RSpec.describe 'messages#index', type: :request do
  let!(:homer) { User.create!(name: 'Homer Simpson') }
  let!(:mr_burns) { User.create!(name: 'Mr. Burns') }
  let!(:message1) { Message.create!(sender: homer, receiver: mr_burns, content: 'message1') }
  let!(:message2) { Message.create!(sender: mr_burns, receiver: homer, content: 'message2') }

  it 'lists messages' do
    get '/api/messages'
    expect(response.status).to eq(200)
    expect(json_items.length).to eq(2)
    assert_payload(:message, message1, json_items[0])
    assert_payload(:message, message2, json_items[1])
  end
end
