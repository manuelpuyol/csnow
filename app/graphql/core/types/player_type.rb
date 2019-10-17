# frozen_string_literal: true

module Core
  module Types
    class PlayerType < ::Types::BaseObject
      graphql_name 'Player'

      field :id, ID, null: false
      field :name, String, null: false
      field :presentation_name, String, null: false
      field :nickname, String, null: false
      field :nationality, String, null: false
      field :active, Boolean, null: true

      # Relations
      field :rosters, [RosterType], null: false, preload: :rosters
      field :rankings, [PlayerRankingType], null: false, preload: :rankings
      field :teams, [TeamType], null: false, preload: :teams
    end
  end
end
