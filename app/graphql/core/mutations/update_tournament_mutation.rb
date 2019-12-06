# frozen_string_literal: true

module Core
  module Mutations
    class UpdateTournamentMutation < ::BaseMutation
      argument :id, ID, required: true
      argument :name, String, required: true
      argument :location, String, required: false
      argument :start_at, Core::Types::TimeType, required: true
      argument :end_at, Core::Types::TimeType, required: true

      field :tournament, Core::Types::TournamentType, null: false

      def resolve(id:, location: nil, **attrs)
        tournament = Tournament.find(id)

        tournament.update(attrs.merge(location: location))

        { tournament: Tournament.find(id, includes: %i[tournament_placements rosters teams]) }
      end
    end
  end
end
