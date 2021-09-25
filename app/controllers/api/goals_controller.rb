# frozen_string_literal: true

module Api
  # Api::GoalsController
  class GoalsController < Api::BaseController
    skip_before_action :doorkeeper_authorize!, only: %i[index]

    def index
      render json: GoalsSerializer.new(Goal.all).serializable_hash
    end
  end
end
