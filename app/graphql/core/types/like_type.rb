# frozen_string_literal: true

module Core
  module Types
    class LikeType < ::Types::BaseObject
      graphql_name 'Like'

      field :id, ID, null: false

      # Relations
      field :likeable, LikeableType, null: false
      field :user, UserType, null: false, preload: :user
    end
  end
end
