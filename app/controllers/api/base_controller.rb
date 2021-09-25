# frozen_string_literal: true

module Api
  # Api::BaseController
  class BaseController < ActionController::API
    include ::Api::TokenAuthenticabile
    include ::Api::ExceptionHandler
    include ::Api::Response
    include Pundit

    respond_to :json
    before_action :doorkeeper_authorize!

    def render_error(error, status: :bad_request)
      render json: { errors: error }, status: status
    end

    private

    def pundit_user
      current_resource_owner
    end
  end
end
