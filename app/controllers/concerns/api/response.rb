module Api
  module Response # rubocop:todo Style/Documentation
    def json_response(object, status = :ok)
      render json: object.to_json, status: status # , headers: {"Content-Type": "application/json"}
    end
  end
end
