# frozen_string_literal: true

# Message class to handle all messages in one place
class Message
  class << self
    def not_found(record = 'record')
      "Sorry, #{record} not found."
    end

    def bad_request
      'OH man, this is really bad request, you know?'
    end

    def invalid_credentials
      'Invalid credentials'
    end

    def invalid_token
      'Invalid token'
    end

    def missing_token
      'Missing token'
    end

    def unauthorized
      'Unauthorized request'
    end

    def account_created
      'Account created successfully'
    end

    def account_not_created
      'Account could not be created'
    end

    def expired_token
      'Sorry, your token has expired. Please login to continue.'
    end

    def permission_denied
      'Permission denied.'
    end
  end
end
