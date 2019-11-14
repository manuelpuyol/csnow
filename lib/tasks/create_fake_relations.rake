# frozen_string_literal: true

require 'json'

task :create_fake_relations, [] => :environment do |_t, args|
  players = Player.last(20000).to_a
  teams = Team.last(10000).to_a
  users = User.all
  matches = Match.all
  i = 1

  while players.size > 4
    puts "Team #{i}"
    pls = players.sample(5)
    players = players - pls
    t = teams.sample
    teams = teams - [t]

    roster = Roster.create!(
      team: t,
      start_at: Time.now
    )

    pls.each do |player|
      PlayerRoster.create!(
        player: player,
        roster: roster
      )
    end

    i += 1
  end

  users.each_with_index do |user, index|
    puts "User #{index}"
    matches.sample(50).each do |match|
      Bet.create(
        match: match,
        winner: match.rosters.sample,
        placed_at: match.start_at - 1,
        user: user
      )
    end

    Friendship.create(
      requester: user,
      receiver: users[index - 1],
      state: Friendship.states.values.sample
    )
  end
end
