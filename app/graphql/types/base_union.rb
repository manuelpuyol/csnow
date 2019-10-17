# frozen_string_literal: true

module Types
  class BaseUnion < GraphQL::Schema::Union
    def self.resolve_type(object, _context)
      object.class.graphql_type
    end
  end
end
