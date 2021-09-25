# frozen_string_literal: true

class UserSerializer
  include JSONAPI::Serializer
  attributes :email

  attribute :goals do |record|
    record.goals.map { |goal| { title: goal.title, id: goal.id } }
  end

  attribute :meta do |record|
    {
      max_stress_level: record.stress_logs.maximum(:stress_level),
      average_stress_level: record.stress_logs.average(:stress_level).to_i,
      min_stress_level: record.stress_logs.minimum(:stress_level)
    }
  end
end
