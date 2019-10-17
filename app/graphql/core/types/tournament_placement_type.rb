# frozen_string_literal: true

module Core
  module Types
    class TournamentPlacementType < ::Types::BaseObject
      graphql_name 'TournamentPlacement'

      field :id, ID, null: false
      field :place, Int, null: false
      field :prize, Float, null: true

      # Relations
      field :tournament, TournamentType, null: true
      field :roster, RosterType, null: false
      field :team, TeamType, null: false
    end
  end
end
