# frozen_string_literal: true

module Core
  module Types
    class LikeableType < ::Types::BaseUnion
      graphql_name 'Likeable'

      possible_types TeamType, PlayerType
    end
  end
end
