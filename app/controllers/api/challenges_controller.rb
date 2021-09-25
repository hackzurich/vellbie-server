# frozen_string_literal: true

module Api
  # Api::ChallengesController
  class ChallengesController < Api::BaseController
    def create
      current_resource_owner.user_goals.create!(goal_params)

      render json: UserSerializer.new(current_resource_owner).serializable_hash
    end

    private

    def goal_params
      params.permit(:goal_id)
    end
  end
end
