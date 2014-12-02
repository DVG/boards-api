module Api
  module V1
    class SessionsController < ApiController
      
      skip_before_action :authenticate

      def create
        user = User.find_by(username: params[:identification])
        if user && user.authenticate(params[:password])
          render json: { auth_token: user.auth_token, current_username: user.username }, status: :ok
        else
          render json: { error: "Access Denied" }, status: 401
        end
      end

    end
  end
end
