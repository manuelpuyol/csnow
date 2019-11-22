# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  extend SqlExtensions
  self.abstract_class = true
end
