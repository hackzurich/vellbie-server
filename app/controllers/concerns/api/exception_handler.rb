# frozen_string_literal: true

# Api::ExceptionHandler for custom api json error handling
module Api
  module ExceptionHandler # rubocop:todo Style/Documentation
    extend ActiveSupport::Concern

    # Define custom error subclasses - rescue catches `StandardErrors`
    class AuthenticationError < StandardError; end

    class MissingToken < StandardError; end

    class InvalidToken < StandardError; end

    class BadRequest < StandardError; end

    class NotAuthorizedError < StandardError; end

    included do
      # Define custom handlers
      rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
      rescue_from Api::ExceptionHandler::AuthenticationError, with: :unauthorized_request
      rescue_from Api::ExceptionHandler::MissingToken, with: :four_twenty_two
      rescue_from Api::ExceptionHandler::InvalidToken, with: :four_twenty_two
      rescue_from Api::ExceptionHandler::BadRequest, with: :four_twenty_two
      rescue_from StandardError, with: :four_twenty_two
      rescue_from Pundit::NotAuthorizedError, with: :unauthorized_request
      rescue_from Api::ExceptionHandler::NotAuthorizedError, with: :unauthorized_request

      rescue_from ActiveRecord::RecordNotFound do |e|
        json_response({ message: e.message }, :not_found)
      end
    end

    private

    # JSON response with message; Status code 422 - unprocessable entity
    def four_twenty_two(err)
      Rollbar.error(err)

      json_response({
                      message: err.message,
                      description: err.exception,
                      trace: err.full_message
                    }, :unprocessable_entity)
    end

    # JSON response with message; Status code 401 - Unauthorized
    def unauthorized_request(err)
      json_response({ message: err.message }, :unauthorized)
    end
  end
end
