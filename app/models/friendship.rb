# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :requester, class_name: 'Contract'
  belongs_to :receiver, class_name: 'Contract'
end

# == Schema Information
#
# Table name: friendships
#
#  id           :integer          not null, primary key
#  state        :string
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
