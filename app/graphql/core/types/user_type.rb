# frozen_string_literal: true

module Core
  module Types
    class UserType < ::Types::BaseObject
      graphql_name 'User'

      field :id, ID, null: false
      field :name, String, null: false
      field :email, String, null: false
      field :nickname, String, null: false
      field :nationality, String, null: false
      field :active, Boolean, null: true

      # Relations
      field :friends, [UserType], null: false
      field :likes, [LikeType], null: false, preload: :likes
      field :bets, [BetType], null: false, preload: :bets
      field :liked_teams, [TeamType], null: false, preload: :liked_teams
      field :liked_players, [PlayerType], null: false, preload: :liked_players
    end
  end
end
