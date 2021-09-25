# frozen_string_literal: true

# module which add methods in API controller for authenticate by token
module Api
  module TokenAuthenticabile # rubocop:todo Style/Documentation
    extend ActiveSupport::Concern

    included do
      def current_resource_owner
        @current_resource_owner ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token

        raise Api::ExceptionHandler::AuthenticationError if @current_resource_owner.nil?
        raise Api::ExceptionHandler::BadRequest, 'User is not confirmed' unless @current_resource_owner.confirmed?

        @current_resource_owner
      end
    end
  end
end
