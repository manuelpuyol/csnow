# frozen_string_literal: true

module Core
  module Mutations
    class CreateTournamentMutation < ::BaseMutation
      argument :name, String, required: true
      argument :location, String, required: false
      argument :start_at, Core::Types::TimeType, required: true
      argument :end_at, Core::Types::TimeType, required: false

      field :tournament, Core::Types::TournamentType, null: false

      def resolve(attrs)
        tournament = Tournament.create(attrs.merge(hltv_id: 0))

        { tournament: tournament }
      end
    end
  end
end
