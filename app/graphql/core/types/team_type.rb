# frozen_string_literal: true

module Core
  module Types
    class TeamType < ::Types::BaseObject
      graphql_name 'Team'

      field :id, ID, null: false
      field :name, String, null: false
      field :logo, String, null: true
      field :active, Boolean, null: true

      # Relations
      field :players, [PlayerType], null: false, preload: :players
      field :rosters, [RosterType], null: false, preload: :rosters
      field :rankings, [TeamRankingType], null: false, preload: :rankings
    end
  end
end
