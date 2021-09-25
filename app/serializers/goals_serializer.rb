class GoalsSerializer
  include JSONAPI::Serializer
  attributes :title, :description
end
