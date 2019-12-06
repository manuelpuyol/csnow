# frozen_string_literal: true

module Core
  module Mutations
    class CreateMatchMutation < ::BaseMutation
      argument :tournament_id, ID, required: true
      argument :upper_roster_id, ID, required: false
      argument :lower_roster_id, ID, required: false
      argument :winner_id, ID, required: false
      argument :start_at, Core::Types::TimeType, required: true
      argument :end_at, Core::Types::TimeType, required: false

      field :match, Core::Types::MatchType, null: false

      def resolve(attrs)
        match = Match.create(attrs.merge(hltv_id: 0), includes: %i[tournament upper_roster lower_roster winner])

        { match: match }
      end
    end
  end
end
