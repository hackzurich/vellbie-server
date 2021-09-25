# frozen_string_literal: true

module Api
  # Api::DashboardController
  class DashboardController < Api::BaseController
    def index
      render json: DashboardSerializer
        .new(current_resource_owner)
        .serializable_hash
    end
  end
end
