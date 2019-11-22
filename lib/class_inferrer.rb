# frozen_string_literal: true

class ClassInferrer
  def self.infer(name, options)
    return options[:class_name].constantize if options[:class_name]

    name.to_s.singularize.camelize.constantize
  end
end
