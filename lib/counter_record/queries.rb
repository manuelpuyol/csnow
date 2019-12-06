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

    def update(attrs)
      self.class.update(id, attrs)
      assign_attributes(attrs)
      self
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
        query = "#{generate_query(includes: includes)} WHERE #{where_statement(args)} #{limit_statement(limit)}"
        sql_result = connection.execute(query)

        cast_sql_results(sql_result.to_a, includes)
      end

      def update(id, attrs)
        binding.pry
        query = generate_update_query(id, attrs)

        connection.execute(query)
      end
    end
  end
end
