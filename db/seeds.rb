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

coldzera = Player.create!(
  name: 'Marcelo David',
  nickname: 'coldzera',
  nationality: :brazilian
)

fnx = Player.create!(
  name: 'Lincoln Lau',
  nickname: 'fnx',
  nationality: :brazilian
)

mibr = Team.create!(
  name: 'MIBR',
  logo: 'https://liquipedia.net/counterstrike/File:MIBR_2018.png'
)

sk = Team.create!(
  name: 'SK Gaming',
  logo: 'https://liquipedia.net/counterstrike/File:SK_Gaming.png'
)

sk2016 = Roster.create!(
  team: sk,
  start_at: Time.zone.parse('01/07/2016'),
  end_at: Time.zone.parse('03/12/2016')
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
  roster: sk2016,
  player: fer
)

PlayerRoster.create!(
  roster: mibr2019,
  player: fallen
)

PlayerRoster.create!(
  roster: sk2016,
  player: fallen
)

PlayerRoster.create!(
  roster: mibr2019,
  player: taco
)

PlayerRoster.create!(
  roster: sk2016,
  player: taco
)

PlayerRoster.create!(
  roster: sk2016,
  player: coldzera
)

PlayerRoster.create!(
  roster: sk2016,
  player: fnx
)

PlayerRoster.create!(
  roster: mibr2019,
  player: kngv
)

PlayerRoster.create!(
  roster: mibr2019,
  player: lucas1
)

cologne2016 = Tournament.create!(
  name: 'ESL One Cologne',
  start_at: Time.zone.parse('05/07/2016'),
  end_at: Time.zone.parse('10/07/2016'),
  location: 'Cologne'
)

esl = Tournament.create!(
  name: 'ESL Pro League Season 10: Finals',
  start_at: Time.zone.parse('03/12/2019'),
  end_at: Time.zone.parse('08/12/2019'),
  location: 'Odense'
)

mibr_match = Match.create!(
  tournament: esl,
  upper_roster: mibr2019,
  start_at: esl.start_at,
  stage: Match.stages[:groups]
)

TournamentPlacement.create!(
  tournament: cologne2016,
  roster: sk2016,
  place: 1,
  prize: 500_000
)

TournamentPlacement.create!(
  tournament: esl,
  roster: mibr2019,
  prize: 0
)

PlayerLike.create!(
  user: manuel,
  likeable: fallen
)

TeamLike.create!(
  user: manuel,
  likeable: mibr
)

PlayerRanking.create!(
  player: coldzera,
  rank: 10,
  ranked_at: Time.zone.parse('31/12/2018')
)

PlayerRanking.create!(
  player: coldzera,
  rank: 1,
  ranked_at: Time.zone.parse('31/12/2017')
)

PlayerRanking.create!(
  player: coldzera,
  rank: 1,
  ranked_at: Time.zone.parse('31/12/2016')
)

PlayerRanking.create!(
  player: fer,
  rank: 3,
  ranked_at: Time.zone.parse('31/12/2017')
)

PlayerRanking.create!(
  player: fer,
  rank: 15,
  ranked_at: Time.zone.parse('31/12/2016')
)

PlayerRanking.create!(
  player: fnx,
  rank: 19,
  ranked_at: Time.zone.parse('31/12/2016')
)

PlayerRanking.create!(
  player: fallen,
  rank: 6,
  ranked_at: Time.zone.parse('31/12/2017')
)

PlayerRanking.create!(
  player: fallen,
  rank: 2,
  ranked_at: Time.zone.parse('31/12/2016')
)

TeamRanking.create!(
  roster: mibr2019,
  rank: 12,
  points: 207,
  ranked_at: Time.zone.parse('14/10/2019')
)

TeamRanking.create!(
  roster: mibr2019,
  rank: 14,
  points: 207,
  ranked_at: Time.zone.parse('07/10/2019')
)

Bet.create!(
  user: manuel,
  winner: mibr2019,
  match: mibr_match,
  placed_at: Time.zone.parse('16/10/2019')
)
