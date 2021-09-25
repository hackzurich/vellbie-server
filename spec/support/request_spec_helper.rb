# frozen_string_literal: true

module RequestSpecHelper
  # Parse JSON response to ruby hash
  def json
    JSON.parse(response.body)
  end

  def valid_headers(user)
    user_token = access_token(user).token
    {
      "Authorization": ['Bearer', user_token].join(' ')
    }.with_indifferent_access
  end

  def invalid_headers
    {
      "Authorization": 'Bearer 123444'
    }
  end

  def access_token(user)
    FactoryBot.create(:access_token, resource_owner_id: user.id)
  end
end
