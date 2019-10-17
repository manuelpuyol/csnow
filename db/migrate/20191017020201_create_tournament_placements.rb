# frozen_string_literal: true

class CreateTournamentPlacements < ActiveRecord::Migration[6.0]
  def change
    create_table :tournament_placements do |t|
      t.references :tournament, null: false, foreign_key: true
      t.references :roster, null: false, foreign_key: true
      t.integer :place, null: false
      t.integer :prize, null: false, default: 0

      t.timestamps
    end
  end
end
