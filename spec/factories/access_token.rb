# frozen_string_literal: true

FactoryBot.define do
  factory :access_token, class: 'Doorkeeper::AccessToken' do
    resource_owner_id { create :user }

    before :create do |record|
      record.application_id = ::Doorkeeper::Application.create(name: Faker::Name.name, redirect_uri: '').id
      record.resource_owner_id
    end
  end

  factory :app, class: 'Doorkeeper::Application' do
    redirect_uri { '' }
    name { Faker::Name.name }
  end
end
