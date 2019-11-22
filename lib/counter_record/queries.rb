# frozen_string_literal: true

module CounterRecord
  module Queries
    def self.included(base)
      base.class_eval do
        extend ClassMethods
        extend ::CounterRecord::QueryBuilder
        extend ::CounterRecord::ModelCaster
      end
    end

    module ClassMethods
      def all(includes: nil)
        query = generate_query(includes)
        sql_result = connection.execute(query)

        cache_included_reflections(includes)

        cast_sql_results(sql_result)
      end

      def find(id, includes: nil)
        query = "#{generate_query(includes)} #{first_statement(id)}"
        sql_result = connection.execute(query)

        cast_sql_results(sql_result)
      end

      def first(includes: nil)
        query = "#{generate_query(includes)} #{first_statement}"
        sql_result = connection.execute(query)

        cast_sql_results(sql_result)
      end

      def where(args, includes: nil)
        query = "#{generate_query(includes)} WHERE #{where_statement(args)}"
        sql_result = connection.execute(query)

        cast_sql_results(sql_result)
      end
    end
  end
end
