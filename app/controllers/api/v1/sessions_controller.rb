module Api
  module V1
    class SessionsController < ApiController
      
      skip_before_action :authenticate

      def create
        session = Session.new(username: params[:identification], password: params[:password])
        if session.valid?
          user = session.user
          render json: { auth_token: user.auth_token, username: user.username, email: user.email }, status: :ok
        else
          render json: { errors: session.errors }.to_json, status: 401
        end
      end

    end
  end
end
