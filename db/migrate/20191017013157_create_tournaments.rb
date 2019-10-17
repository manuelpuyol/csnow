# frozen_string_literal: true

class CreateTournaments < ActiveRecord::Migration[6.0]
  def change
    create_table :tournaments do |t|
      t.string :name, null: false
      t.string :location
      t.timestamp :start_at, null: false
      t.timestamp :end_at, null: false

      t.timestamps
    end
  end
end
