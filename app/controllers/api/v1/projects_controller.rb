module Api
  module V1
    class ProjectsController < ApiController

      def index
        respond_with current_user.projects
      end

      def create
        @project = current_user.projects.build(project_params)
        if @project.save
          render json: @project
        else
          render json: {errors: @project.errors }.to_json, status: :unprocessable_entity
        end
      end

      def show
        @project = Project.find(params[:id])
        render json: @project
      end


private

      def project_params
        params.require(:project).permit(:name)
      end
    end
  end
end
