# frozen_string_literal: true

# UserAcitivitySerializer
# Serialise User activities
class UserAcitivitySerializer
  include JSONAPI::Serializer
  attributes

  attribute :user do |record|
    {
      type: :user,
      id: record.user.id,
      attributes: {
        email: record.user.email
      }
    }
  end
end
