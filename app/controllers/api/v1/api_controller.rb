module Api
  module V1
    class ApiController < ApplicationController
      before_action :authenticate
      respond_to :json

protected

      def current_user
        @current_user
      end

private

      def authenticate
        (authenticate_token || render_unauthorized)
      end

      def authenticate_token
        authenticate_with_http_token do |token, options|
          @current_user = User.find_by(auth_token: token)
        end
      end

      def render_unauthorized
        self.headers['WWW-Authenticate'] = 'Token realm="Application"'
        render json: 'Bad credentials', status: 401
      end

    end
  end
end
