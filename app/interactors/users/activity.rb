# frozen_string_literal: true

module Users
  # Users::Activity
  # Creates a user activity
  class Activity
    include Interactor

    def call
      context.activity = context.user.user_activities.build(context.params)

      context.fail!(error: context.activity.errors) unless context.activity.save
    end
  end
end
