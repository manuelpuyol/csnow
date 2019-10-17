# frozen_string_literal: true

manuel = ::User.create!(
  email: 'manuelpuyol@gmail.com',
  name: 'Manuel Puyol',
  password: '1234567890'
)

nathalia = ::User.create!(
  email: 'nathaliasgomes@gmail.com',
  name: 'Nathalia Gomes',
  password: '1234567890'
)

::Friendship.create!(
  requester: manuel,
  receiver: nathalia,
  state: ::Friendship.states[:accepted]
)
