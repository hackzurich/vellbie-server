class UserSerializer
  include JSONAPI::Serializer
  attributes :email

  attribute :goals do |record|
    record.goals.map { |goal| { title: goal.title, id: goal.id } }
  end
end
