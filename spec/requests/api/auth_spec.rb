# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/api/oauth/token', type: :request do # rubocop:disable Metrics/BlockLength
  describe 'POST /oauth/token' do # rubocop:disable Metrics/BlockLength
    path '/oauth/token' do # rubocop:disable Metrics/BlockLength
      post 'returns a login credentials' do # rubocop:disable Metrics/BlockLength
        tags 'User'
        consumes 'application/json'

        parameter name: :payload, in: :body, schema: {
          type: :object,
          properties: {
            email: { type: :string, default: 'test01@test.com' },
            password: { type: :string, default: '123456abc@' },
            grant_type: { type: :string, default: 'password' },
            client_id: { type: :string, default: 'yPomFOwElqDKvSDk82PuKipmo0LScIm4j_5H_zB5_KM' },
            client_secret: { type: :string, default: 'MzUuHA6_DnNZme61VY2Zzc3mxqzS53H0iNGuqIcW6aE' }
          }
        }
        response '200', 'fetches a token' do
          let(:password) { '123456abc@' }
          let(:user) { create :user, password: password }
          let(:doorkeeper_application) { create :doorkeeper_application }
          let(:payload) do
            {
              email: user[:email],
              password: password,
              grant_type: 'password',
              client_id: doorkeeper_application.uid,
              client_secret: doorkeeper_application.secret
            }
          end

          run_test!
        end
      end
    end
  end
end
