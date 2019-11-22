# frozen_string_literal: true

module CounterRecord
  module ModelCaster
    def cast_sql_results(results)
      if results.count == 1
        cast_to_model(self, table_name, results[0])
      else
        cast_multiple_results(results)
      end
    end

    private

    def cast_to_model(klass, table_name, result)
      klass.new(model_params(klass, table_name, result))
    end

    def cast_multiple_results(results)
      results.map do |result|
        cast_to_model(self, table_name, result)
      end
    end

    def model_params(klass, table_name, result)
      klass.column_names.each_with_object({}) do |col, obj|
        obj[col] = result["#{table_name}_#{col}"]
      end
    end
  end
end
