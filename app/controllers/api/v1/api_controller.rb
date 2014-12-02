module Api
  module V1
    class ApiController < ApplicationController
      before_action :authenticate
      attr_accessor :current_user
      respond_to :json

private

      def authenticate
        (authenticate_token || render_unauthorized)
      end

      def authenticate_token
        authenticate_with_http_token do |token, options|
          current_user = User.find_by(auth_token: token)
        end
      end

      def render_unauthorized
        self.headers['WWW-Authenticate'] = 'Token realm="Application"'
        render json: 'Bad credentials', status: 401
      end

    end
  end
end
