# frozen_string_literal: true

class Like < ApplicationRecord
  LIEKABLE_MODELS = %w[Player Team].freeze

  belongs_to :user
  belongs_to :likeable, polymorphic: true

  validates :user, presence: true
  validates :likeable, presence: true
  validates :likeable_type, inclusion: { in: LIEKABLE_MODELS }
end

# == Schema Information
#
# Table name: likes
#
#  id            :integer          not null, primary key
#  user_id       :integer          not null
#  likeable_type :string           not null
#  likeable_id   :integer          not null
#  type          :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_likes_on_likeable_type_and_likeable_id  (likeable_type,likeable_id)
#  index_likes_on_user_id                        (user_id)
#
