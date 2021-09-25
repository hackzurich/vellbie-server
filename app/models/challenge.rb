# frozen_string_literal: true

class Challenge < ApplicationRecord
  belongs_to :goal
  belongs_to :activity
end
