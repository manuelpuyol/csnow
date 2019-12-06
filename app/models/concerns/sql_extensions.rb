# frozen_string_literal: true

module SqlExtensions
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
