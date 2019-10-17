# frozen_string_literal: true

module Core
  module Types
    class TeamRankingType < ::Types::BaseObject
      graphql_name 'TeamRanking'

      field :id, ID, null: false
      field :rank, Int, null: false
      field :points, Int, null: false
      field :ranked_at, ::Types::DateTimeType, null: false

      # Relations
      field :team, TeamType, null: true, preload: :team
    end
  end
end
