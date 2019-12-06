# frozen_string_literal: true

class Tournament < ApplicationRecord
  has_many :matches, dependent: :destroy
  has_many :tournament_placements, dependent: :destroy
  has_many :rosters, through: :tournament_placements, foreign_key: :roster_id
  has_many :teams, through: :rosters, foreign_key: :team_id
  has_many :players, through: :rosters, foreign_key: :player_id

  validates :name, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true, after: { attr: :start_at, null: false }

  def champions
    tournament_placements.find_by(place: 1)&.team
  end

  def finished
    end_at.present? && end_at.past?
  end
end

# == Schema Information
#
# Table name: tournaments
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  location   :string
#  start_at   :datetime         not null
#  end_at     :datetime         not null
#  hltv_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
