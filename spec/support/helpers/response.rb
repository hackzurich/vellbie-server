# frozen_string_literal: true

module Helpers
  module Responses
    def json
      JSON.parse response.body
    end
  end
end
