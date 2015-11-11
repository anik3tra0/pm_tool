class ProjectsController < ApplicationController

	before_filter :authenticate_user!
	before_action :find_record, only: [:edit, :show, :update, :destroy]
	load_and_authorize_resource

def index
	@projects = (current_user.role? "admin") ? Project.all : current_user.projects
		respond_to do |format|
			format.html
			format.xls
			format.pdf
	end
end

def new
	@project = Project.new
end

def create
	@project = Project.new(project_params)
	@project.user_id = current_user.id
	if @project.save
		redirect_to project_path(@project)
	else
		render 'new'
	end
end

def show
	

end

def edit
end

def update
end

def destroy
end

def set_current_project
 session[:project] = Project.find(params[:project_id]).id
 redirect_to projects_path 
end


private

def find_record
	begin
		@project = @project = (current_user.role? "admin") ? Project.find(params[:id]) : current_user.projects.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		redirect_to root_path, notice: "Record Doesn't exist"
	end
end

	
def project_params
	params[:project].permit(:name, :client_id, :description, :status, :start_date)
end
end
