# frozen_string_literal: true

class TournamentPlacement < ApplicationRecord
  belongs_to :tournament
  belongs_to :roster

  validates :tournament, presence: true
  validates :roster, presence: true
  validates :place, numericality: { greater_than: 0 }
  validates :prize, numericality: { greater_than_or_equal_to: 0 }
end

# == Schema Information
#
# Table name: tournament_placements
#
#  id            :integer          not null, primary key
#  tournament_id :integer          not null
#  roster_id     :integer          not null
#  place         :integer          not null
#  prize         :integer          default("0"), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_tournament_placements_on_roster_id      (roster_id)
#  index_tournament_placements_on_tournament_id  (tournament_id)
#
