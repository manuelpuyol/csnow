# frozen_string_literal: true

class CreateIterations < ActiveRecord::Migration[6.0]
  def change
    create_table :iterations do |t|
      t.timestamp :start_at, null: false
      t.timestamp :end_at
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
