# frozen_string_literal: true

class GoalsSerializer
  include JSONAPI::Serializer
  attributes :title, :description
end
