# frozen_string_literal: true

module Api
  # Api::ActivityController
  class ActivityController < Api::BaseController
    def index
      render json: ActivitySerializer.new(
        current_resource_owner.activities.last(3)
      ).serializable_hash
    end

    def create
      subject = ::Users::Activity.call(
        user: current_resource_owner,
        params: create_activity_params
      )
      return render_error(subject.error) if subject.failure?

      render json: ActivitySerializer.new(subject.activity).serializable_hash
    end

    private

    def create_activity_params
      params.require(:activity).permit(
        :activity_id
      )
    end
  end
end
