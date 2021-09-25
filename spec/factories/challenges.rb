# frozen_string_literal: true

FactoryBot.define do
  factory :challenge do
    goal { nil }
    level { 1 }
    activity
  end
end
