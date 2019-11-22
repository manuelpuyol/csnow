# frozen_string_literal: true

module CounterRecord
  module QueryBuilder
    def generate_query(*includes)
      include_sql_hash = generate_includes(includes.compact)
      select_fields = include_sql_hash[:select] << "#{table_name}.*"

      select_statement = "SELECT #{select_fields.join(', ')} FROM #{table_name}"
      join_statements = include_sql_hash[:join].join(' ')

      "#{select_statement} #{join_statements}"
    end

    def find_statement(id)
      "WHERE #{table_name}.id = #{id.to_i}"
    end

    def first_statement
      "ORDER BY #{table_name}.id ASC LIMIT 1"
    end

    def where_statement(args)
      case args
      when Hash
        sanitize_sql_for_conditions(hash_where_statement(args))
      when String
        sanitize_sql_for_conditions(args)
      else
        raise ArgumentError, "Unexpected argument type #{args.class}"
      end
    end

    private

    def generate_includes(includes)
      base_hash = { select: [], join: [] }
      return base_hash if includes.blank?

      includes.each_with_object(base_hash) do |include, obj|
        single_include = generate_single_include(include)
        obj[:select] << single_include[:select]
        obj[:join] << single_include[:join]
      end
    end

    def generate_single_include(include)
      relation = relations[include]

      case relation[:type]
      when CounterRecord::Relations::RELATION_TYPES[:has_many]
        build_has_many_join(relation)
      when CounterRecord::Relations::RELATION_TYPES[:belongs_to]
        build_belongs_to_join(relation)
      else
        raise ArgumentError, "Unexpected relation type #{relation.dig(:type)}"
      end
    end

    def build_has_many_join(relation)
      table_alias = relation[:table_alias]
      relation_table = relation[:table_name]
      column_name = relation[:column_name]

      {
        select: ["#{table_alias}.*"],
        join: ["INNER JOIN #{relation_table} AS #{table_alias} ON #{table_alias}.#{column_name} = #{table_name}.id"]
      }
    end

    def build_belongs_to_join(relation)
      table_alias = relation[:table_alias]
      relation_table = relation[:table_name]
      column_name = relation[:column_name]

      {
        select: ["#{table_alias}.*"],
        join: ["INNER JOIN #{relation_table} AS #{table_alias} ON #{table_alias}.id = #{table_name}.#{column_name}"]
      }
    end

    def hash_where_statement(kwargs)
      kwargs.map do |key, value|
        case value
        when Array
          "#{table_name}.#{key} IN (#{value.join(', ')})"
        else
          "#{table_name}.#{key} = #{value}"
        end
      end.join(' AND ')
    end
  end
end
