class TasksController < ApplicationController
  before_action :set_tasks, only: %i(index, create)

  def index
  end

  def create
  end

  private

  def set_tasks
    @tasks = current_user.tasks.includes(:todo) if user_signed_in?
  end
end
