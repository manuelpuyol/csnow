# frozen_string_literal: true

module Core
  module Resolvers
    class TournamentsResolver < ::BaseResolver
      type [Core::Types::TournamentType], null: false

      def resolve
        tournaments
      end

      private

      def tournaments
        @tournaments ||= Tournament.all
      end
    end
  end
end
