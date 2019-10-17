# frozen_string_literal: true

module Core
  module Types
    class TournamentType < ::Types::BaseObject
      graphql_name 'Tournament'

      field :id, ID, null: false
      field :name, String, null: false
      field :location, String, null: true
      field :start_at, ::Types::DateTimeType, null: true
      field :end_at, ::Types::DateTimeType, null: true
      field :finished, Boolean, null: false

      # Relations
      field :champions, TeamType, null: true
    end
  end
end
