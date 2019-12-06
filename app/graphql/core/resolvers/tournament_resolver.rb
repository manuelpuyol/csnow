# frozen_string_literal: true

module Core
  module Resolvers
    class TournamentResolver < ::BaseResolver
      type Core::Types::TournamentType, null: false

      argument :id, ID, required: true

      def resolve(id:)
        Tournament.find(id, includes: relations)
      end

      private

      def relations
        %i[tournament_placements rosters matches]
      end
    end
  end
end
