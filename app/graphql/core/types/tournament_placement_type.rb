# frozen_string_literal: true

module Core
  module Types
    class TournamentPlacementType < ::Types::BaseObject
      graphql_name 'TournamentPlacement'

      field :id, ID, null: false
      field :place, Int, null: false
      field :prize, Float, null: true

      # Relations
      field :tournament, TournamentType, null: true, preload: :tournament
      field :roster, RosterType, null: false, preload: :roster
      field :team, TeamType, null: false, preload: :team
    end
  end
end
