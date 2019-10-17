# frozen_string_literal: true

class PlayerRoster < ApplicationRecord
  belongs_to :roster
  belongs_to :player

  validates :roster, presence: true
  validates :player, presence: true, uniqueness: { scope: [:roster] }
end

# == Schema Information
#
# Table name: player_rosters
#
#  id         :integer          not null, primary key
#  roster_id  :integer          not null
#  player_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_player_rosters_on_player_id  (player_id)
#  index_player_rosters_on_roster_id  (roster_id)
#
