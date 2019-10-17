# frozen_string_literal: true

class CreatePlayerRankings < ActiveRecord::Migration[6.0]
  def change
    create_table :player_rankings do |t|
      t.references :player, null: false, foreign_key: true
      t.integer :rank, null: false
      t.timestamp :ranked_at, null: false

      t.timestamps
    end
  end
end
