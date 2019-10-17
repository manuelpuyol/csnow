# frozen_string_literal: true

module Core
  module Types
    class RosterType < ::Types::BaseObject
      graphql_name 'Roster'

      field :id, ID, null: false
      field :start_at, ::Types::DateTimeType, null: false
      field :end_at, ::Types::DateTimeType, null: true

      # Relations
      field :team, TeamType, null: false
      field :players, [PlayerType], null: false
    end
  end
end
