# frozen_string_literal: true

class CsnowSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  use(GraphQL::Batch)
  enable_preloading
end
