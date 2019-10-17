# frozen_string_literal: true

class CreateBets < ActiveRecord::Migration[6.0]
  def change
    create_table :bets do |t|
      t.references :user, null: false, foreign_key: true
      t.references :winner, null: false, foreign_key: { to_table: :rosters }
      t.references :match, null: false, foreign_key: true
      t.timestamp :placed_at, null: false

      t.timestamps
    end
  end
end
