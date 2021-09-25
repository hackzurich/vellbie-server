require 'rails_helper'

RSpec.describe 'Api::Imports', type: :request do
  path '/api/import' do
    post 'Imports FitRockr user data' do
      tags 'User::FitRockr'
      security [Bearer: []]
      consumes 'application/json'
      description 'Imports Garmin data from FitRockr API to the app DB'
      parameter name: :payload, in: :body, schema: {
        type: :object,
        properties: {
          startDate: { type: :string, default: '2021-09-24' },
          endDate: { type: :string, default: '2021-09-25' }
        }
      }

      response '200', 'POST /api/imports' do
        let(:user) { create :user }
        let(:Authorization) { valid_headers(user)[:Authorization] }
        let(:payload) do
          {
            startDate: '2021-09-24',
            endDate: '2021-09-25'
          }
        end

        run_test!
      end
    end
  end
end
