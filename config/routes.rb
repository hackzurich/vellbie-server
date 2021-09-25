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
      get :goals, to: 'goals#index'

      post :export, to: 'export#create'
      post :import, to: 'import#create'
      post 'signup', to: 'registrations#create'

      resources :user
      resources :challenges, only: %i[index show create]
      resources :activity, only: %i[index show create]
    end
  end

  resource :auth, only: %i[create]
end
