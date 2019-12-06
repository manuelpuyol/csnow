# frozen_string_literal: true

module Core
  module Mutations
    class DeleteTournamentMutation < ::BaseRelayMutation

      argument :id, ID, required: true

      def resolve(id:)
        tournament = Tournament.find(id)

        tournament.destroy!
      end
    end
  end
end
