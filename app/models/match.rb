# frozen_string_literal: true

class Match < ApplicationRecord
  belongs_to :upper_roster, class_name: 'Roster', optional: true
  belongs_to :lower_roster, class_name: 'Roster', optional: true
  belongs_to :winner, class_name: 'Roster', optional: true
  belongs_to :tournament
  has_many :bets, dependent: :destroy

  validates :tournament, presence: true
  validates :end_at, after: { attr: :start_at, null: true }
  validate :winner_must_be_in_match

  def rosters
    [upper_roster, lower_roster].compact
  end

  private

  def winner_must_be_in_match
    errors.add('Winner must be in match') if winner != upper_roster && winner != lower_roster
  end
end

# == Schema Information
#
# Table name: matches
#
#  id              :integer          not null, primary key
#  upper_roster_id :integer
#  lower_roster_id :integer
#  winner_id       :integer
#  tournament_id   :integer          not null
#  start_at        :datetime
#  end_at          :datetime
#  hltv_id         :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_matches_on_lower_roster_id  (lower_roster_id)
#  index_matches_on_tournament_id    (tournament_id)
#  index_matches_on_upper_roster_id  (upper_roster_id)
#  index_matches_on_winner_id        (winner_id)
#
