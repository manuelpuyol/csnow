# frozen_string_literal: true

manuel = User.create!(
  email: 'manuelpuyol@gmail.com',
  name: 'Manuel Puyol',
  password: '1234567890'
)

nathalia = User.create!(
  email: 'nathaliasgomes@gmail.com',
  name: 'Nathalia Gomes',
  password: '1234567890'
)

Friendship.create!(
  requester: manuel,
  receiver: nathalia,
  state: Friendship.states[:accepted]
)

Player.create!(
  name: 'Fernando Alvarenga',
  nickname: 'fer',
  nationality: :brazilian
)

Player.create!(
  name: 'Grabriel Toledo',
  nickname: 'Fallen',
  nationality: :brazilian
)

Player.create!(
  name: 'Epitácio de Melo',
  nickname: 'TACO',
  nationality: :brazilian
)

Player.create!(
  name: 'Vito Giuseppe',
  nickname: 'kNgV',
  nationality: :brazilian
)

Player.create!(
  name: 'Lucas Teles',
  nickname: 'LUCAS1',
  nationality: :brazilian
)
