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
        @matches ||= Match.all
      end
    end
  end
end
