# frozen_string_literal: true

Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  scope defaults: { format: :json } do
    use_doorkeeper do
      controllers tokens: 'api/users/tokens'
    end

    namespace :api do
      resources :user
      post 'signup', to: 'registrations#create'
    end
  end
end
