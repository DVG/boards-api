module Api
  module V1
    class UsersController < ApiController

      skip_before_action :authenticate, only: [:create]

      def create
        @user = User.new(registration_params)
        if @user.save
          render json: @user, serializer: UserSerializer
        else
          render json: { errors: @user.errors }.to_json, status: :unprocessable_entity
        end

      end

private

      def registration_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
      end

    end
  end
end
