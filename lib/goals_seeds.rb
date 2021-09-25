# frozen_string_literal: true

# GoalsSeeds
class GoalsSeeds
  def self.call # rubocop:disable Metrics/MethodLength
    [
      'Weight Loss',
      'Body shape',
      'Improve health',
      'Healthy habits',
      'Professional training',
      'Mindfulness',
      'De-stress',
      'Healthy eating',
      'Build good eating habits',
      'Meditation'
    ].each do |goal|
      Goal.create(title: goal, description: 'Goal desription')
    end
  end
end
