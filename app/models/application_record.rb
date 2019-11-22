# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  include CounterRecord::Relations

  self.abstract_class = true
end
