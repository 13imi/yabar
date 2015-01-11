class TasksController < ApplicationController
  before_action :set_tasks

  def index
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path }
        format.js
      end
    end
  end

  private

  def set_tasks
    @tasks = current_user.tasks.includes(:todos) if user_signed_in?
  end

  def task_params
    params.require(:task).permit(:name, :deadline, :yabasa, :memo)
  end
end
