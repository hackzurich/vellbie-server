module Api
  # User registration controller
  class RegistrationsController < Api::BaseController
    skip_before_action :doorkeeper_authorize!, only: %i[create]

    def create
      subject = ::Users::Create.call(params: user_params)
      return render_error subject.error if subject.failure?

      render json: UserSerializer.new(subject.user).serializable_hash
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :client_id, :terms_accepted_at)
    end

    def generate_refresh_token
      loop do
        # generate a random token string and return it,
        # unless there is already another token with the same string
        token = SecureRandom.hex(32)
        break token unless Doorkeeper::AccessToken.exists?(refresh_token: token)
      end
    end
  end
end
