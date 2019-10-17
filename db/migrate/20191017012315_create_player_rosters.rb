# frozen_string_literal: true

class CreatePlayerRosters < ActiveRecord::Migration[6.0]
  def change
    create_table :player_rosters do |t|
      t.references :roster, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
