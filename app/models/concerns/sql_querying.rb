# frozen_string_literal: true

module SqlQuerying
  def find(id)
    sql_result = connection.execute("SELECT * FROM #{table_name} WHERE id = #{id.to_id}")[0]

    new(sql_result)
  end

  def first
    sql_result = connection.execute("SELECT * FROM #{table_name} ORDER BY id ASC LIMIT 1")[0]

    new(sql_result)
  end

  def where(args)
    sql_result = connection.execute("SELECT * FROM #{table_name} WHERE #{where_statement(args)}")

    sql_result.map do |result|
      new(result)
    end
  end

  private

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
      "#{key} = #{value}"
    end.join(' AND ')
  end
end
