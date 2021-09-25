# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Activities', type: :request do
  path '/api/activity' do
    get 'GET user activity' do
      tags 'User::Activity'
      description 'User recent activities'
      security [Bearer: []]
      consumes 'application/json'

      response '200', 'GET /api/activities' do
        let(:user) { create :user }
        let(:Authorization) { valid_headers(user)[:Authorization] }
        let(:activity) { create :activity }
        let!(:user_activity) { create :user_activity, user: user, activity: activity }

        run_test!
      end
    end

    post 'POST user activity' do
      tags 'User::Activity'
      description 'Create new activity'
      security [Bearer: []]
      consumes 'application/json'
      parameter name: :payload, in: :body, schema: {
        type: :object,
        properties: {
          activity: {
            type: :object,
            properties: {
              id: { type: :integer, default: 2 }
            }
          }
        }
      }

      response '200', 'POST user activity' do
        let(:user) { create :user }
        let(:activity) { create :activity }
        let(:Authorization) { valid_headers(user)[:Authorization] }
        let(:payload) do
          {
            activity: {
              activity_id: activity.id
            }
          }
        end

        run_test!
      end
    end
  end
end
