# frozen_string_literal: true

FactoryBot.define do
  factory :doorkeeper_application, class: 'Doorkeeper::Application' do
    name { Faker::Name.name }
    redirect_uri { 'https://example.com' }
  end
end
