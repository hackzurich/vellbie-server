# frozen_string_literal: true

class Goal < ApplicationRecord
  has_many :user_goals
end
