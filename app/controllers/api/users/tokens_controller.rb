# frozen_string_literal: true

module Api
  module Users
    # Api::Users::TokensController overrides Doorkeeper::TokensController
    class TokensController < Doorkeeper::TokensController
      def create
        headers.merge!(authorize_response.headers)

        render json: authorize_response.body.merge(user_meta),
               status: authorize_response.status
      rescue Doorkeeper::Errors::DoorkeeperError => e
        handle_token_exception(e)
      end

      protected

      def user_meta
        UserSerializer
          .new(resource_owner_from_credentials)
          .serializable_hash
      end
    end
  end
end
