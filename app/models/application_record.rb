# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  extend SqlQuerying
  self.abstract_class = true
end
