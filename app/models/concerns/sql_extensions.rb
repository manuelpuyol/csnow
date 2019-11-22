# frozen_string_literal: true

module SqlExtensions
  def all(includes: nil)
    query = generate_query(includes)
    sql_result = connection.execute(query)

    cache_included_reflections(includes)

    binding.pry

    sql_result.map do |result|
      cast_sql_result(result)
    end
  end

  def find(id, includes: nil)
    query = "#{generate_query(includes)} WHERE #{table_name}.id = #{id.to_i}"
    sql_result = connection.execute(query)[0]

    cast_sql_result(sql_result)
  end

  def first(includes: nil)
    query = "#{generate_query(includes)} ORDER BY #{table_name}.id ASC LIMIT 1"
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

  private

  def cast_sql_result(result)
    new(result.slice(*column_names))
  end

  def cache_included_reflections(includes)
    return if includes.nil?

    case includes
    when Array
      cache_reflections(includes)
    when Symbol
      cache_reflections([includes])
    else
      raise ArgumentError, "Unexpected argument type #{includes.class}"
    end
  end

  def cache_reflections(includes)
    includes.each do |reflection|
      klass = ::ClassInferrer.infer(name, reflections[reflection.to_s].options)

      reflections = klass.cast_sql_result
      instance_variable_set("@#{reflection}", klass.where(column_name => id))
    end
  end

  def generate_query(includes)
    include_sql_hash = generate_includes(includes)
    select_fields = include_sql_hash[:select] << "#{table_name}.*"

    select_statement = "SELECT #{select_fields.join(', ')} FROM #{table_name}"
    join_statements = include_sql_hash[:join].join(' ')

    "#{select_statement} #{join_statements}"
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

  def generate_includes(includes)
    return { select: [], join: [] } if includes.nil?

    case includes
    when Symbol, String
      generate_single_include(includes)
    when Array
      generate_multiple_includes(includes)
    else
      raise ArgumentError, "Unexpected argument type #{args.class}"
    end
  end

  def generate_single_include(include)
    reflection = reflections[include.to_s]
    reflection_table_name = reflection_table(reflection, include)
    table_alias = include.to_s.pluralize

    case reflection.class.name
    when 'ActiveRecord::Reflection::HasManyReflection'
      {
        select: ["#{table_alias}.*"],
        join: ["INNER JOIN #{reflection_table_name} AS #{table_alias} ON #{table_alias}.#{table_name.singularize}_id = #{table_name}.id"]
      }
    when 'ActiveRecord::Reflection::BelongsToReflection'
      {
        select: ["#{table_alias}.*"],
        join: ["INNER JOIN #{reflection_table_name} AS #{table_alias} ON #{table_alias}.id = #{table_name}.#{include.to_s.singularize}_id"]
      }
    else
      raise ArgumentError, "Unexpected reflection type #{reflection.class}"
    end
  end

  def generate_multiple_includes(includes)
    includes.each_with_object(select: [], join: []) do |include, obj|
      single_include = generate_single_include(include)
      obj[:select] << single_include[:select]
      obj[:join] << single_include[:join]
    end
  end

  def reflection_table(reflection, include)
    if reflection.options[:class_name].present?
      reflection.options[:class_name].downcase.pluralize
    else
      include.to_s.pluralize
    end
  end
end
