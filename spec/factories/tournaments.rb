# frozen_string_literal: true

FactoryBot.define do
  factory :tournament do
    sequence(:name) { |n| "Tournament #{n}" }
    start_at { 1.month.ago }
    end_at { 1.month.from_now }
  end
end

# == Schema Information
#
# Table name: tournaments
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  location   :string
#  start_at   :datetime         not null
#  end_at     :datetime         not null
#  hltv_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
