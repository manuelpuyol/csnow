# frozen_string_literal: true

class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.string :nickname, null: false
      t.string :nationality, null: false
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
