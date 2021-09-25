# frozen_string_literal: true

# FitRockrInterface
# Fetches data from FitRockr API
class FitRockrInterface
  attr_accessor :connection

  def initialize(uri: 'https://api.fitrockr.com', query: '')
    @connection = ::Faraday.new(
      url: uri,
      params: query,
      headers: {
        'Content-Type' => 'application/json',
        'X-API-Key' => Rails.application.credentials.dig(:fitrockr, :x_api_key),
        'X-Tenant' => 'hackzurich'
      }
    )
  end

  def stress
    url = 'https://api.fitrockr.com/v1/users/614eddb99187a32ff317145c/stress'
    connection.get(url)
  end
end
