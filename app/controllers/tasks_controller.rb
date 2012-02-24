class TasksController < ApplicationController

  def index
    @tasks = Task.unassigned
    @task = Task.new
    @todos = Todo.all_with_tasks
  end

  def create
    @task = Task.new(params[:task])
    @task.save
    redirect_to root_path
  end

  def sort
    Task.sort(params[:task], params[:todo])
    render nothing: true
  end

end
