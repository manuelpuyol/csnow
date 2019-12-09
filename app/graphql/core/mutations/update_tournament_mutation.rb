# frozen_string_literal: true

module Core
  module Mutations
    class UpdateTournamentMutation < ::BaseMutation
      argument :id, ID, required: true
      argument :name, String, required: true
      argument :location, String, required: false
      argument :start_at, Core::Types::TimeType, required: true
      argument :end_at, Core::Types::TimeType, required: true

      field :tournament, Core::Types::TournamentType, null: true
      field :errors, [String], null: true

      def resolve(id:, location: nil, **attrs)
        tournament = Tournament.find(id, includes: %i[tournament_placements rosters teams])

        res = tournament.update(attrs.merge(location: location))

        if res
          { tournament: tournament }
        else
          { errors: tournament.errors.full_messages }
        end
      end
    end
  end
end
