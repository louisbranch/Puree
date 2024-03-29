class TasksController < ApplicationController

  respond_to :html, :js

  def index
    @tasks = Task.unassigned
    @task = Task.new
    @todos = Todo.all_with_tasks
    @pomodoro = Pomodoro.ongoing
  end

  def show
    @task = Task.find(params[:id])
    render :layout => false
  end

  def create
    @task = Task.new(params[:task])
    @task.save
    respond_with @task, :location => root_path
  end

  def sort
    if params[:task]
      Task.sort(params[:task], params[:todo])
    end
    render nothing: true
  end

end
