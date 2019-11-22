# frozen_string_literal: true

module CounterRecord
  module Queries
    extend ::CounterRecord::Queries

    def self.included(base)
      base.class_eval do
        extend ClassMethods
      end
    end

    module ClassMethods
      def all(includes: nil)
        query = generate_query(includes)
        sql_result = connection.execute(query)

        cache_included_reflections(includes)

        sql_result.map do |result|
          cast_sql_result(result)
        end
      end

      def find(id, includes: nil)
        query = "#{generate_query(includes)} #{first_statement(id)}"
        sql_result = connection.execute(query)[0]

        cast_sql_result(sql_result)
      end

      def first(includes: nil)
        query = "#{generate_query(includes)} #{order_statement}"
        sql_result = connection.execute(query)[0]

        cast_sql_result(sql_result)
      end

      def where(args, includes: nil)
        query = "#{generate_query(includes)} WHERE #{where_statement(args)}"
        sql_result = connection.execute(query)

        sql_result.map do |result|
          cast_sql_result(result)
        end
      end
    end
  end
end
