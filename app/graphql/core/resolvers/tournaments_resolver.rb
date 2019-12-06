# frozen_string_literal: true

module Core
  module Resolvers
    class TournamentsResolver < ::BaseResolver
      type [Core::Types::TournamentType], null: false

      argument :search, String, required: false

      def resolve(search: nil)
        if search.nil?
          tournaments
        else
          Tournament.where(['name ILIKE ?', "%#{search}%"], includes: relations)
        end
      end

      private

      def tournaments
        @tournaments ||= Tournament.all(includes: relations)
      end

      def relations
        %i[tournament_placements rosters teams]
      end
    end
  end
end
