# frozen_string_literal: true

class CreateTeamRankings < ActiveRecord::Migration[6.0]
  def change
    create_table :team_rankings do |t|
      t.references :roster, null: false, foreign_key: true
      t.integer :rank, null: false
      t.timestamp :ranked_at, null: false
      t.integer :points, null: false

      t.timestamps
    end
  end
end
