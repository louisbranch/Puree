class TasksController < ApplicationController

  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task])
    @task.save
    redirect_to root_path
  end

  def sort
    tasks = params[:task]
    if tasks
      tasks.each_with_index { |id, index| Task.update_all({position: (index+1)},{id: id}) }
    end
    render nothing: true
  end

end
