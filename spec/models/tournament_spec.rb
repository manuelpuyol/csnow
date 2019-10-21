# frozen_string_literal: true

require 'rails_helper'

describe Tournament do
  it 'has a valid factory' do
    expect(FactoryBot.build(:tournament)).to be_valid
  end

  context 'relationships' do
    it 'works', :aggregate_failures do
      is_expected.to have_many(:matches).dependent(:destroy)
      is_expected.to have_many(:tournament_placements).dependent(:destroy)
      is_expected.to have_many(:rosters).through(:tournament_placements)
      is_expected.to have_many(:teams).through(:rosters)
      is_expected.to have_many(:players).through(:rosters)
    end
  end

  context 'validations' do
    it 'works', :aggregate_failures do
      is_expected.to validate_presence_of(:name)
      is_expected.to validate_presence_of(:start_at)
      is_expected.to validate_presence_of(:end_at)
    end
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
