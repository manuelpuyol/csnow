# frozen_string_literal: true

module Core
  module Types
    class MatchStagesEnumType < ::Types::BaseEnum
      graphql_name 'MatchStagesEnum'

      Match.stages.each do |stage|
        value(stage.to_s.upcase, value: stage)
      end
    end
  end
end
