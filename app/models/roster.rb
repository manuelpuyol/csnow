# frozen_string_literal: true

class Roster < ApplicationRecord
  belongs_to :team
  has_many :player_rosters
  has_many :players, through: :player_rosters

  validates :start_at, presence: true
  validate :end_at_must_be_after_start_at

  private

  def end_at_must_be_after_start_at
    errors.add('End at must be after than start_at') if end_at.present? && end_at > start_at
  end
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
