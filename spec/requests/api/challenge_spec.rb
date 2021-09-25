# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Challenges', type: :request do # rubocop:disable Metrics/BlockLength
  path '/api/challenges' do # rubocop:disable Metrics/BlockLength
    post 'Create a new user challenge' do
      description 'User accepts and aprticipates to a challenge'
      tags 'User::Challenges'
      consumes 'application/json'
      security [Bearer: []]
      consumes 'application/json'
      parameter name: :payload, in: :body, schema: {
        type: :object,
        properties: {
          challenge_id: { type: :integer, default: 3 }
        }
      }

      response '200', 'POST /api/challenge' do
        let(:user) { create :user }
        let(:Authorization) { valid_headers(user)[:Authorization] }
        let(:activity) { create :activity }
        let(:challenge) { create :challenge, activity: activity, goal: goal }
        let(:goal) { create :goal }
        let(:payload) do
          {
            goal_id: goal.id
          }
        end

        run_test!
      end
    end
  end
end
