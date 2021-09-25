# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Dashboards', type: :request do
  path '/api/dashboard' do
    get 'fetches user dashboard data' do
      tags 'User::Dashboard'
      description 'User Dashboard JSON data'
      consumes 'application/json'
      security [Bearer: []]

      response '200', 'GET /api/dashboard' do
        let(:user) { create :user }
        let(:Authorization) { valid_headers(user)[:Authorization] }

        run_test!
      end
    end
  end
end
