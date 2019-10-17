# frozen_string_literal: true

FactoryBot.define do
  factory :tournament do
    sequence(:name) { |n| "Tournament #{n}" }
    start_at { 1.month.ago }
    end_at { 1.month.from_now }
  end
end
