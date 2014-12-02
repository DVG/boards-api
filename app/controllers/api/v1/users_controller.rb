module Api
  module V1
    class UsersController < ApiController

      skip_before_action :authenticate, only: [:create]

      def create
        render json: User.create!(registration_params), serializer: UserSerializer
      end

private

      def registration_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
      end

    end
  end
end
