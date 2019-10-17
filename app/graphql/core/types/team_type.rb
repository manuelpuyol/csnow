# frozen_string_literal: true

module Core
  module Types
    class TeamType < ::Types::BaseObject
      graphql_name 'Team'

      field :id, ID, null: false
      field :name, String, null: false
      field :logo, String, null: true
      field :active, Boolean, null: true
    end
  end
end
