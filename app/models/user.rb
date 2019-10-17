# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :sent_friendship_requests,
           class_name: 'User',
           foreign_key: :requester_id,
           inverse_of: :requester,
           dependent: :destroy
  has_many :received_friendship_requests,
           class_name: 'User',
           foreign_key: :receiver_id,
           inverse_of: :receiver,
           dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  scope :friends_with, lambda { |user_id|
    users = User.arel_table
    friendships = Friendship.arel_table

    join_table = users.join(friendships, Arel::Nodes::InnerJoin)
                      .on(
                        friendships[:receiver_id].eq(user_id)
                        .or(
                          friendships[:requester_id].eq(user_id)
                        )
                      )
                      .join_sources

    joins(join_table).where.not(id: user_id).distinct
  }

  def friends
    User.friends_with(id)
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
