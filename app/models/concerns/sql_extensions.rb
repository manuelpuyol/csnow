# frozen_string_literal: true

module SqlExtensions
  def all(includes: nil)
    query = generate_query(includes)
    sql_result = connection.execute(query)

    cache_included_reflections(includes)

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
end
