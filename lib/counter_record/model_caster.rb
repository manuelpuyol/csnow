# frozen_string_literal: true

module CounterRecord
  module ModelCaster
    def cast_sql_results(results)
      if results.count == 1
        cast_single_result(results[0])
      else
        cast_multiple_results(results)
      end
    end

    private

    def cast_single_result(result)
      new(result.slice(*column_names))
    end

    def cast_multiple_results(results)
      results.map do |result|
        cast_single_result(result)
      end
    end
  end
end
