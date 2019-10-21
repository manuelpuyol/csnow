# frozen_string_literal: true

class Team < ApplicationRecord
  alias_attribute :rankings, :team_rankings

  def self.graphql_type
    Core::Types::TeamType
  end

  has_many :rosters, dependent: :destroy
  has_many :tournament_placements, through: :rosters
  has_many :tournaments, through: :tournament_placements
  has_many :team_rankings, through: :rosters

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
#  hltv_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
