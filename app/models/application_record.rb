# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  include CounterRecord::Base

  self.abstract_class = true
end
