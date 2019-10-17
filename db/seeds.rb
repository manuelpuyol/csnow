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

fer = Player.create!(
  name: 'Fernando Alvarenga',
  nickname: 'fer',
  nationality: :brazilian
)

fallen = Player.create!(
  name: 'Grabriel Toledo',
  nickname: 'Fallen',
  nationality: :brazilian
)

taco = Player.create!(
  name: 'Epitácio de Melo',
  nickname: 'TACO',
  nationality: :brazilian
)

kngv = Player.create!(
  name: 'Vito Giuseppe',
  nickname: 'kNgV',
  nationality: :brazilian
)

lucas1 = Player.create!(
  name: 'Lucas Teles',
  nickname: 'LUCAS1',
  nationality: :brazilian
)

mibr = Team.create!(
  name: 'MIBR',
  logo: 'http://ssl.gstatic.com/onebox/media/sports/logos/esports/sTulRxt2BNR0c21I_lQTeQ_64x64.png'
)

mibr2019 = Roster.create!(
  team: mibr,
  start_at: Time.zone.parse('05/09/2019'),
  end_at: nil
)

PlayerRoster.create!(
  roster: mibr2019,
  player: fer
)

PlayerRoster.create!(
  roster: mibr2019,
  player: fallen
)

PlayerRoster.create!(
  roster: mibr2019,
  player: taco
)

PlayerRoster.create!(
  roster: mibr2019,
  player: kngv
)

PlayerRoster.create!(
  roster: mibr2019,
  player: lucas1
)
