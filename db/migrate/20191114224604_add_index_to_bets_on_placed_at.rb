# frozen_string_literal: true

class AddIndexToBetsOnPlacedAt < ActiveRecord::Migration[6.0]
  def change
    add_index :bets, :placed_at
  end
end
