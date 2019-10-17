# frozen_string_literal: true

class Player < ApplicationRecord
  alias_attribute :rankings, :player_rankings

  def self.graphql_type
    Core::Types::PlayerType
  end

  has_many :player_rosters, dependent: :destroy
  has_many :rosters, through: :player_rosters
  has_many :teams, through: :rosters
  has_many :tournament_placements, through: :rosters
  has_many :tournaments, through: :tournament_placements
  has_many :player_rankings, dependent: :destroy

  validates :name, presence: true
  validates :nationality, presence: true
  validates :nickname, presence: true

  def presentation_name
    split_name = name.split(' ')

    "#{split_name.first} \"#{nickname}\" #{split_name.last}"
  end
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
