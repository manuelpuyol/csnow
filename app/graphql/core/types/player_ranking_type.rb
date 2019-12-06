# frozen_string_literal: true

module Core
  module Types
    class PlayerRankingType < ::Types::BaseObject
      graphql_name 'PlayerRanking'

      field :id, ID, null: false
      field :rank, Int, null: false
      field :ranked_at, ::Types::DateTimeType, null: false

      # Relations
      field :player, PlayerType, null: true
    end
  end
end
