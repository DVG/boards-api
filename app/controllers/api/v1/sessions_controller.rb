module Api
  module V1
    class SessionsController < ApiController

      def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
          render json: { auth_token: user.auth_token }, status: :ok
        else
          render json: { error: "Access Denied" }, status: 401
        end
      end

    end
  end
end
