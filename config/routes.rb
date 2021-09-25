# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  scope defaults: { format: :json } do
    use_doorkeeper do
      controllers tokens: 'api/users/tokens'
    end

    namespace :api do
      get :dashboard, to: 'dashboard#index'
      resources :user
      post 'signup', to: 'registrations#create'
    end
  end
  resource :auth, only: %i[create]
end
