# frozen_string_literal: true

module Core
  module Types
    class MatchType < ::Types::BaseObject
      graphql_name 'Match'

      field :id, ID, null: false
      field :upper_roster_id, ID, null: false
      field :lower_roster_id, ID, null: false
      field :winner_id, ID, null: true
      field :start_at, ::Types::DateTimeType, null: false
      field :end_at, ::Types::DateTimeType, null: true

      # Relations
      field :rosters, [RosterType], null: false, preload: %i[upper_roster lower_roster]
      field :winner, RosterType, null: true, preload: :winner
      field :tournament, TournamentType, null: false, preload: :tournament
      field :bets, [BetType], null: false, preload: :bets
    end
  end
end
