# frozen_string_literal: true

module Core
  module Mutations
    class DeleteTournamentMutation < ::BaseMutation
      argument :id, ID, required: true

      field :errors, Boolean, null: false

      def resolve(id:)
        tournament = Tournament.find(id)

        result = tournament.destroy

        {
          errors: !result
        }
      end
    end
  end
end
