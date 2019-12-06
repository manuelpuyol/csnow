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
      field :likes, [LikeType], null: false
      field :bets, [BetType], null: false
      field :liked_teams, [TeamType], null: false
      field :liked_players, [PlayerType], null: false
    end
  end
end
