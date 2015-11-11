class TasksController < ApplicationController
def new
	@task = Task.new
end

	def create
		@task = Task.new(task_params)
		if @task.save
			redirect_to project_path(@task.project_id)
		else
			render action: "new"
		end
	end

	def mark_as_complete
		@task = Task.find(params[:task_id])
		@task.update_attributes(is_completed: true)
		Notification.completed_task(@task).deliver!
		redirect_to :back
	end

	def mark_as_incomplete
		@task = Task.find(params[:task_id])
		@task.update_attributes(is_completed: false)
		Notification.incompleted_task(@task).deliver!
		redirect_to :back
	end

private

def task_params
	params[:task].permit(:name, :project_id, :is_completed, :due_date)
end

end

