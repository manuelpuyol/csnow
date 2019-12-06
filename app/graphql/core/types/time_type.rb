# frozen_string_literal: true

module Core
  module Types
    class TimeType < ::Types::BaseScalar

      graphql_name 'Time'
      description 'Time represented in ISO 8601'

      def self.coerce_input(value, _ctx)
        Time.zone.parse(value)
      end

      def self.coerce_result(value, _ctx)
        value.iso8601
      end
    end
  end
end
