# frozen_string_literal: true

require 'json'

events_json = JSON.parse(File.read("#{Rails.root}/db/seed_data/events.json"))
matches_json = JSON.parse(File.read("#{Rails.root}/db/seed_data/matches.json"))
players_json = JSON.parse(File.read("#{Rails.root}/db/seed_data/players.json"))
teams_json = JSON.parse(File.read("#{Rails.root}/db/seed_data/teams.json"))

events = events_json['events'].map do |event|
  Tournament.create!({
    hltv_id: event['hltvId'],
    name: event['name'],
    start_at: Time.at(event['dateStart'] / 1000),
    end_at: Time.at(event['dateEnd'] / 1000),
    location: event['location']
  })
end

teams = teams_json['teams'].map do |team|
  name = team['name'].present? ? team['name'] :team['hltvId'].to_s
  Team.create!({
    hltv_id: team['hltvId'],
    name: name,
    logo: team['logo'],
    active: true
  })
end

rosters = teams.map do |team|
  Roster.create!(
    team: team,
    start_at: Time.now
  )
end

players = players_json['players'].map do |player|
  x = Player.create!(
    hltv_id: player['hltvId'],
    name: player['name'],
    nickname: player['nickname'],
    photo: player['photo'],
    nationality: player['nationality'],
    active: true
  )

  PlayerRoster.create!(
    player: x,
    roster: rosters.find{|x| x.team.hltv_id == player['teamId']}
  )

  x
end

matches_json['matches'].each do |match|
  next if match['eventHltvId'].nil?

  roster_1 = rosters.find{|x| x.team.hltv_id == match['team1HltvId']}
  roster_2 = rosters.find{|x| x.team.hltv_id == match['team2HltvId']}
  event = events.find{|x| x.hltv_id == match['eventHltvId']}

  score = match['result'].split(' - ').map(&:to_i)

  winner = score.first > score.last ? roster_1 : roster_2

  Match.create!({
    hltv_id: match['hltvId'],
    upper_roster: roster_1,
    lower_roster: roster_2,
    tournament: event,
    start_at: Time.at(match['date'] / 1000),
    winner: winner
  })
end

users = (1..100).map do |_i|
  name = Faker::Name.name
  user = User.create!({
    name: name,
    email: Faker::Internet.free_email(name: name),
    password: '1234567890'
  })

  (1..10).each do |_j|
    PlayerLike.create({
      user: user,
      likeable: players.sample
    })
  end

  (1..5).each do |_j|
    TeamLike.create({
      user: user,
      likeable: teams.sample
    })
  end

  user
end

(0..98).each do |i|
  Friendship.create!({
    requester: users[i],
    receiver: users[i + 1],
    state: Friendship.states.values.sample
  })
end
