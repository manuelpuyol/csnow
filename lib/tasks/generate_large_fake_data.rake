# frozen_string_literal: true

require 'json'

task :generate_large_fake_data, [] => :environment do |_t, args|
  players = (1..10000).map do |i|
    name = Faker::Name.unique.name
    nickname = name.split(' ').map {|n| n.first.downcase }.join
    player = Player.create(
      name: Faker::Name.unique.name,
      nickname: nickname,
      nationality: Faker::Address.country,
      hltv_id: 10000 * i,
      active: false
    )

    puts "PLAYER: #{i} / 10000"

    player
  end

  teams = (1..10000).map do |i|
    name = Faker::Alphanumeric.alpha(number: 10)
    team = Team.create!(
      name: name,
      logo: "https://ui-avatars.com/api/?background=0D8ABC&color=fff&rounded=true&name=#{name.split(' ').join('+')}",
      active: false,
      hltv_id: 10000 * i
    )

    puts "TEAM: #{i} / 10000"

    team
  end

  users = (1..10000).map do |i|
    name = Faker::Name.unique.name
    user = User.create!(
      name: name,
      email: Faker::Internet.unique.free_email(name: name),
      password: '1234567890'
    )

    (1..10).each do |_j|
      PlayerLike.create(
        user: user,
        likeable: players.sample
      )
    end

    (1..5).each do |_j|
      TeamLike.create(
        user: user,
        likeable: teams.sample
      )
    end

    puts "USER: #{i} / 10000"

    user
  end

end
