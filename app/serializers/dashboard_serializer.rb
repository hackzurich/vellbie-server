class DashboardSerializer
  include JSONAPI::Serializer
  attribute :user do |record|
    {
      name: record.email,
      activity: 'Last active 5h ago'
    }
  end
  attribute :challenges do
    {
      count: 20
    }
  end

  attribute :level do
    {
      index: 2
    }
  end

  attribute :rewards do
    {
      points: 3
    }
  end

  attribute :netword do
    {
      count: 34
    }
  end

  attribute :stats do
    [{
      label: :view, action: :action
    }]
  end
end
