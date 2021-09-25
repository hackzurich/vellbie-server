require 'rails_helper'

RSpec.describe 'Api::Registrations', type: :request do # rubocop:disable Metrics/BlockLength
  path '/api/signup' do # rubocop:disable Metrics/BlockLength
    post 'creates user account with app credentials' do # rubocop:disable Metrics/BlockLength
      tags 'User'
      description 'POST with user and app payload creates a user record'
      consumes 'application/json'
      parameter name: :payload, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              email: { type: :string, default: 'test@test.com' },
              password: { type: :string, default: '123456abc@' },
              terms_accepted_at: { type: :boolean },
              client_id: { type: :string, default: 'yPomFOwElqDKvSDk82PuKipmo0LScIm4j_5H_zB5_KM' },
              client_secret: { type: :string, default: 'MzUuHA6_DnNZme61VY2Zzc3mxqzS53H0iNGuqIcW6aE' }
            }
          }
        }
      }

      response '200', 'creates a user' do
        let(:doorkeeper_application) { create :doorkeeper_application }
        let(:user) { attributes_for :user }
        let(:payload) do
          {
            user: {
              email: user[:email],
              password: user[:password],
              client_id: doorkeeper_application.uid
            }
          }
        end
        run_test!
      end
    end
  end
end
