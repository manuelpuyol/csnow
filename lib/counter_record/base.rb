# frozen_string_literal: true

module CounterRecord
  module Base
    def self.included(base)
      base.class_eval do
        include ::CounterRecord::Relations
        include ::CounterRecord::Queries
      end
    end
  end
end
