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
      field :players, [PlayerType], null: false
      field :rosters, [RosterType], null: false
      field :rankings, [TeamRankingType], null: false
    end
  end
end
