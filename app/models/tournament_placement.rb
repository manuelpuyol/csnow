# frozen_string_literal: true

class TournamentPlacement < ApplicationRecord
  belongs_to :tournament
  belongs_to :roster
  has_one :team, through: :roster

  validates :tournament, presence: true
  validates :roster, presence: true
  validates :prize, numericality: { greater_than_or_equal_to: 0 }

  scope :with_team_id, ->(team_id) { joins(:team).merge(Team.where(id: team_id)) }
end

# == Schema Information
#
# Table name: tournament_placements
#
#  id            :integer          not null, primary key
#  tournament_id :integer          not null
#  roster_id     :integer          not null
#  place         :string
#  prize         :integer          default("0"), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_tournament_placements_on_roster_id      (roster_id)
#  index_tournament_placements_on_tournament_id  (tournament_id)
#
