# frozen_string_literal: true

require 'json'

task :upload_hltv_data, [:file_path] => :environment do |_t, args|
  data = JSON.parse(File.read(args.file_path))

  events = data['events'].map do |event|
    next if Tournament.where(hltv_id: event['hltvId']).any?

    Tournament.create!(
      hltv_id: event['hltvId'],
      name: event['name'],
      start_at: Time.at(event['dateStart'] / 1000),
      end_at: Time.at(event['dateEnd'] / 1000),
      location: event['location']
    )
  end.compact

  puts "Created #{events.size} Tournaments"

  teams = data['teams'].map do |team|
    next if Team.where(hltv_id: team['hltvId']).any?

    name = team['name'].present? ? team['name'] : team['hltvId'].to_s
    Team.create(
      hltv_id: team['hltvId'],
      name: name,
      logo: team['logo'],
      active: true
    )
  end.compact

  puts "Created #{teams.size} Teams"

  rosters = teams.map do |team|
    Roster.create!(
      team: team,
      start_at: Time.now
    )
  end.compact

  puts "Created #{rosters.size} Rosters"

  players = data['players'].map do |player|
    next if Player.where(hltv_id: player['hltvId']).any?

    x = Player.create!(
      hltv_id: player['hltvId'],
      name: player['name'],
      nickname: player['nickname'],
      photo: player['photo'],
      nationality: player['nationality'],
      active: true
    )

    roster = Roster.with_team_hltv_id(player['teamId']).last
    PlayerRoster.create!(
      player: x,
      roster: roster
    )

    x
  end.compact

  puts "Created #{players.size} Players"

  matches = data['matches'].map do |match|
    next if Match.where(hltv_id: match['hltvId']).any?
    next if match['eventHltvId'].nil?

    roster_1 = Roster.with_team_hltv_id(match['team1HltvId']).last
    roster_2 = Roster.with_team_hltv_id(match['team2HltvId']).last
    tournament = Tournament.find_by(hltv_id: match['eventHltvId'])

    score = match['result'].split(' - ').map(&:to_i)

    winner = score.first > score.last ? roster_1 : roster_2

    Match.create!(
      hltv_id: match['hltvId'],
      upper_roster: roster_1,
      lower_roster: roster_2,
      tournament: tournament,
      start_at: Time.at(match['date'] / 1000),
      winner: winner
    )
  end.compact

  puts "Created #{matches.size} Matches"

  placements = data['events'].map do |event|
    tournament = Tournament.find_by(hltv_id: event['hltvId'])
    next if
    event['placements'].map do |placement|
      next if placement['teamId'].nil?

      roster = Roster.with_team_hltv_id(placement['teamId']).last

      next if TournamentPlacement.where(tournament: tournament).with_team_id(roster.team_id).any?

      prize = placement['prize']&.gsub(',', '').to_i

      TournamentPlacement.create!(
        tournament: tournament,
        place: placement['place'],
        prize: prize,
        roster: roster
      )
    end.compact
  end.flatten.compact

  puts "Created #{placements.size} TournamentPlacements"
end
