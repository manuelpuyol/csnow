# frozen_string_literal: true

module Core
  module Types
    class BetType < ::Types::BaseObject
      graphql_name 'Bet'

      field :id, ID, null: false
      field :placed_at, ::Types::DateTimeType, null: false

      # Relations
      field :match, MatchType, null: false, preload: :match
      field :winner, RosterType, null: false, preload: :winner
      field :user, UserType, null: false, preload: :user
    end
  end
end
