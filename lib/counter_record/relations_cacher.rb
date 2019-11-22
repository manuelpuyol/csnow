# frozen_string_literal: true

module CounterRecord
  module RelationsCacher
    def cache_relations(model, includes, results)
      return if includes.blank?

      includes.each do |include|
        relation = model.relations[include]

        cached_relations = model_relation_results(model.id, relation, results).map do |result|
          cast_to_model(relation[:klass], relation[:table_alias], result)
        end

        model.instance_variable_set(relation[:variable_name], cached_relations)
      end
    end

    private

    def model_relation_results(id, relation, results)
      table_alias = relation[:table_alias]

      results.select { |result| result["#{table_name}_id"] = id }
             .uniq { |result| result["#{table_alias}_id"] }
    end
  end
end