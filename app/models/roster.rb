# frozen_string_literal: true

class Roster < ApplicationRecord
  alias_attribute :rankings, :team_rankings

  belongs_to :team
  has_many :player_rosters, dependent: :destroy
  has_many :players, through: :player_rosters
  has_many :tournament_placements, dependent: :destroy
  has_many :tournaments, through: :tournament_placements
  has_many :team_rankings, dependent: :destroy

  validates :start_at, presence: true
  validates :end_at, after: { attr: :start_at, null: true }
end

# == Schema Information
#
# Table name: rosters
#
#  id         :integer          not null, primary key
#  start_at   :datetime         not null
#  end_at     :datetime
#  team_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_rosters_on_team_id  (team_id)
#
