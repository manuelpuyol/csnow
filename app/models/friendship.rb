# frozen_string_literal: true

class Friendship < ApplicationRecord
  enum state: {
    pending: 'pending',
    rejected: 'rejected',
    accepted: 'accepted'
  }

  belongs_to :requester, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  validates :requester, presence: true
  validates :receiver, presence: true
end

# == Schema Information
#
# Table name: friendships
#
#  id           :integer          not null, primary key
#  state        :string           not null
#  requester_id :integer          not null
#  receiver_id  :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_friendships_on_receiver_id   (receiver_id)
#  index_friendships_on_requester_id  (requester_id)
#
