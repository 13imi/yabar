class TasksController < ApplicationController
  before_action :set_tasks, :set_dates

  def index
    @task = Task.new
    @today = Time.zone.today
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user

    if @task.save
      redirect_to tasks_path, notice: 'タスクを登録しました'
    else
      redirect_to tasks_path, alert: 'すべて項目を入力してください'
    end

    # respond_to do |format|
    # if @task.save
    #   format.html { redirect_to tasks_path }
    #   format.js
    # end
    # end
  end

  def past_tasks
    yesterday = @today.yesterday
    @tasks = @tasks.day_before(yesterday)

    render 'tasks', formats: [:json], handlers: [:jbuilder]
  end

  def current_tasks
    @tasks = @tasks.day_after(@today).day_before(@one_week_after)

    render 'tasks', formats: [:json], handlers: [:jbuilder]
  end

  def future_tasks
    @tasks = @tasks.day_after(@one_week_after + 1.days)

    render 'tasks', formats: [:json], handlers: [:jbuilder]
  end

  private

  def set_tasks
    @tasks = current_user.tasks.includes(:todos) if user_signed_in?
  end

  def set_dates
    @today = Time.zone.today
    @one_week_after = @today + 7.days
  end

  def task_params
    params.require(:task).permit(:name, :deadline, :yabasa, :memo)
  end
end
