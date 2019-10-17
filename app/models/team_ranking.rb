# frozen_string_literal: true

class TeamRanking < ApplicationRecord
  belongs_to :roster

  valdiates :roster, presence: true
  validates :rank, numericality: { greater_than: 0 }
  validates :points, numericality: { greater_than: 0 }
  validates :ranked_at, presence: true
end

# == Schema Information
#
# Table name: team_rankings
#
#  id         :integer          not null, primary key
#  roster_id  :integer          not null
#  rank       :integer          not null
#  ranked_at  :datetime         not null
#  points     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_team_rankings_on_roster_id  (roster_id)
#
