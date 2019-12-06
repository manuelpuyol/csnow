# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :delete_tournament, mutation: Core::Mutations::DeleteTournamentMutation
    field :update_tournament, mutation: Core::Mutations::UpdateTournamentMutation
  end
end
