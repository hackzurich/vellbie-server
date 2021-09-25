# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Exports', type: :request do
  path '/api/export' do
    post 'Export User activity stats' do
      tags 'User::Export'
      description 'Export User activity to external resource in JSON format'
      consumes 'application/json'
      security [Bearer: []]
      parameter name: :payload, in: :body, schema: {
        type: :object,
        properties: {
          from: { type: :string, default: '2021-09-25' },
          to: { type: :string, default: '2021-09-26' }
        }
      }

      response '200', 'POST /api/export' do
        let(:payload) do
          { from: '2021-09-25', to: '2021-09-26' }
        end
        let(:user) { create :user }
        let(:Authorization) { valid_headers(user)[:Authorization] }
        let(:activity) { create :activity }
        let!(:user_activity) { create :user_activity, user: user, activity: activity }

        run_test!
      end
    end
  end
end
