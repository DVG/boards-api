module Api
  module V1
    class ProjectsController < ApiController

      def index
        respond_with current_user.projects
      end

    end
  end
end
