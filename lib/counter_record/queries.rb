# frozen_string_literal: true

module CounterRecord
  module Queries
    def self.included(base)
      base.class_eval do
        extend ClassMethods
        extend ::CounterRecord::QueryBuilder
        extend ::CounterRecord::ModelCaster
        extend ::CounterRecord::RelationsCacher
      end
    end

    def reload(includes: nil)
      self.class.find(id, includes: includes)
    end

    module ClassMethods
      def all(includes: nil, limit: nil)
        query = generate_query(includes: includes, limit: limit)
        sql_result = connection.execute(query)

        cast_sql_results(sql_result.to_a, includes)
      end

      def find(id, includes: nil)
        query = "#{generate_query(includes: includes)} #{find_statement(id)}"
        sql_result = connection.execute(query)

        cast_sql_results(sql_result.to_a, includes).first
      end

      def first(includes: nil)
        query = "#{generate_query(includes: includes)} #{first_statement}"
        sql_result = connection.execute(query)

        cast_sql_results(sql_result.to_a, includes).first
      end

      def where(args, includes: nil, limit: nil)
        query = "#{generate_query(includes: includes, limit: limit)} WHERE #{where_statement(args)}"
        sql_result = connection.execute(query)

        cast_sql_results(sql_result.to_a, includes)
      end
    end
  end
end
