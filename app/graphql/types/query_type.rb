# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :tournaments, resolver: Core::Resolvers::TournamentsResolver
  end
end
