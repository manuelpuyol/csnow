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
        @matches ||= Match.all(includes: [:tournament, :upper_roster, :lower_roster, :winner])
      end
    end
  end
end
