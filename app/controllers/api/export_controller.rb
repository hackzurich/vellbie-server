# frozen_string_literal: true

module Api
  # Api::ExportController
  # Export user activity contoller
  class ExportController < Api::BaseController
    def create
      activity = current_resource_owner
                 .activities
                 .where(
                   'user_activities.created_at > ? and user_activities.created_at < ?',
                   params[:from].to_s, params[:to].to_s
                 )

      render json: ActivitySerializer.new(activity).serializable_hash
    end
  end
end
