# frozen_string_literal: true

module Core
  module Types
    class BetType < ::Types::BaseObject
      graphql_name 'Bet'

      field :id, ID, null: false
      field :placed_at, ::Types::DateTimeType, null: false

      # Relations
      field :match, MatchType, null: false
      field :winner, RosterType, null: false
      field :user, UserType, null: false
    end
  end
end
