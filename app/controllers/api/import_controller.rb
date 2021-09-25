# frozen_string_literal: true

module Api
  # Api::ImportController
  # Import data from FitRockr API to user stress_logs
  class ImportController < Api::BaseController
    def create
      ::FitRockr::Import.call(user: current_resource_owner)

      render json: current_resource_owner.stress_logs.last(24)
    end
  end
end
