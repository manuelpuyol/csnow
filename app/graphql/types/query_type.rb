# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :tournament, resolver: Core::Resolvers::TournamentResolver
    field :tournaments, resolver: Core::Resolvers::TournamentsResolver
    field :matches, resolver: Core::Resolvers::MatchesResolver
  end
end
