# frozen_string_literal: true

class Team < ApplicationRecord
  has_many :iterations, dependent: :destroy
  validates :name, presence: true
  validates :logo, presence: true
end

# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  logo       :string           not null
#  active     :boolean          default("true"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
