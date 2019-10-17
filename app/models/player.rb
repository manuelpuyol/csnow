# frozen_string_literal: true

class Player < ApplicationRecord
  alias_attribute :rankings, :player_rankings

  has_many :player_rosters, dependent: :destroy
  has_many :rosters, through: :player_rosters
  has_many :teams, through: :rosters
  has_many :tournament_placements, through: :rosters
  has_many :tournaments, through: :tournament_placements
  has_many :player_rankings, dependent: :destroy

  validates :name, presence: true
  validates :nationality, presence: true
  validates :nickname, presence: true
end

# == Schema Information
#
# Table name: players
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  nickname    :string           not null
#  nationality :string           not null
#  active      :boolean          default("true"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
