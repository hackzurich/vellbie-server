require 'rails_helper'

RSpec.describe "Api::Goals", type: :request do
  path '/api/goals' do
    get 'GET all current goals' do
      tags 'User::Goals'
      description 'Goals to display on user profile creation process'
      consumes 'application/json'
      security [Bearer: []]

      response '200', 'GET Goals JSON' do
        let(:goal) { create_list :goal, 2 }
        let(:user) { create :user }
        let(:Authorization) { valid_headers(user)[:Authorization] }

        run_test!
      end
    end
  end
end
