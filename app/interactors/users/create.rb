# frozen_string_literal: true

module Users
  class Create # rubocop:todo Style/Documentation
    include Interactor

    def call # rubocop:todo Metrics/AbcSize
      client_app = Doorkeeper::Application.find_by(uid: context.params[:client_id])
      context.fail!(error: ::Message.not_found('Doorkeeper Application')) if client_app.nil?

      context.user = User.new(email: context.params[:email].downcase,
                              password: context.params[:password])

      context.fail!(error: context.user.errors) unless context.user.save
    end
  end
end
