JsonapiSpecHelpers::Payload.register(:message) do
  key(:content)
  key(:date) { |message| message.created_at }
end
