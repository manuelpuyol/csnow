# frozen_string_literal: true

module Core
  module Resolvers
    class MatchesResolver < ::BaseResolver
      type [Core::Types::MatchType], null: false

      def resolve
        matches
      end

      private

      def matches
        @matches ||= Match.all(includes: %i[tournament upper_roster lower_roster winner], limit: 50)
      end
    end
  end
end
