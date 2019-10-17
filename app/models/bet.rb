# frozen_string_literal: true

class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :winner, class_name: 'Roster'
  belongs_to :match

  validates :user, presence: true
  validates :winner, presence: true
  validates :match, presence: true
  validates :placed_at, presence: true
  validate :must_bet_on_a_playing_team
  validate :must_place_bet_before_start_of_game

  private

  def must_bet_on_a_playing_team
    errors.add('Must bet on a playing team') if winner != match.upper_roster && winner != match.lower_roster
  end

  def must_place_bet_before_start_of_game
    errors.add('Must place bet before start of game') if placed_at > match.start_at
  end
end

# == Schema Information
#
# Table name: bets
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  winner_id  :integer          not null
#  match_id   :integer          not null
#  placed_at  :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_bets_on_match_id   (match_id)
#  index_bets_on_user_id    (user_id)
#  index_bets_on_winner_id  (winner_id)
#
