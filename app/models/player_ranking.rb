# frozen_string_literal: true

class PlayerRanking < ApplicationRecord
  belongs_to :player

  validates :player, presence: true
  validates :rank, numericality: { greater_than: 0 }
  validates :ranked_at, presence: true
end

# == Schema Information
#
# Table name: player_rankings
#
#  id         :integer          not null, primary key
#  player_id  :integer          not null
#  rank       :integer          not null
#  ranked_at  :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_player_rankings_on_player_id  (player_id)
#
