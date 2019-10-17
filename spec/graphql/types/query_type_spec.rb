# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'tournaments' do
    let!(:tournaments) { create_pair(:tournament) }

    let(:query) do
      %(query {
        tournaments {
          name
        }
      })
    end

    subject(:result) do
      CsnowSchema.execute(query).as_json
    end

    it 'returns all tournaments' do
      expect(
        result.dig('data', 'tournaments')
      ).to match_array(
        tournaments.map { |tournament| { 'name' => tournament.name } }
      )
    end
  end
end
