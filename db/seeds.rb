[User, Message, Tweet].map(&:delete_all)

homer = User.create! name: 'Homer Simpson',
  email: 'chunkylover53@hotmail.com'

mr_burns = User.create! name: 'Mr. Burns',
  email: 'overlord@rnc.com'

homer.befriend(mr_burns)

tweet1 = homer.tweets.create!(content: "I believe that children are our future. Unless we stop them now.")
homer.tweets.create!(content: "I’m like that guy who single-handedly built the rocket & flew to the moon. What was his name? Apollo Creed?")
mr_burns.tweets.create!(content: "I insist you never wear shoes or a proper necktie again. Just house slippers and the most humiliating tie there is - bolo.")
mr_burns.tweets.create!(parent_id: tweet1.id)

homer.sent_messages.create!(content: 'Screw you!', receiver: mr_burns)
homer.sent_messages.create!(content: 'I quit!', receiver: mr_burns)
mr_burns.sent_messages.create!(content: '...', receiver: homer)
