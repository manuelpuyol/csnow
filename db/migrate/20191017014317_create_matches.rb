# frozen_string_literal: true

class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.references :upper_roster, null: true, foreign_key: { to_table: :rosters }
      t.references :lower_roster, null: true, foreign_key: { to_table: :rosters }
      t.references :winner, null: true, foreign_key: { to_table: :rosters }
      t.references :tournament, null: false, foreign_key: true
      t.string :stage, null: false
      t.timestamp :start_at
      t.timestamp :end_at

      t.timestamps
    end
  end
end
