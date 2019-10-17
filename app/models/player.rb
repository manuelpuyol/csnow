# frozen_string_literal: true

class Player < ApplicationRecord
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
