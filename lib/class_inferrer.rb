# frozen_string_literal: true

class ClassInferrer
  def self.infer(name, class_name = nil, polymorphic)
    return if polymorphic
    return class_name.constantize if class_name

    name.to_s.singularize.camelize.constantize
  end
end
