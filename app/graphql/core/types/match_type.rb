# frozen_string_literal: true

module Core
  module Types
    class MatchType < ::Types::BaseObject
      graphql_name 'Match'

      field :id, ID, null: false
      field :stage, MatchStagesEnumType, null: false
      field :start_at, ::Types::DateTimeType, null: false
      field :end_at, ::Types::DateTimeType, null: true

      # Relations
      field :rosters, [RosterType], null: false
      field :winner, RosterType, null: true
      field :tournament, TournamentType, null: false
      field :bets, [BetType], null: false
    end
  end
end
