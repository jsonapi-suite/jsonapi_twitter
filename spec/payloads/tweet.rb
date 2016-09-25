JsonapiSpecHelpers::Payload.register(:tweet) do
  key(:content)
  key(:date) { |tweet| tweet.created_at }
end
