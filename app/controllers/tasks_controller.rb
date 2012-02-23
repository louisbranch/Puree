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
    tasks = params[:task]
    if tasks
      todo = params[:todo]
      tasks.each_with_index do |id, index|
        Task.update_all({todo_id: todo, position: (index+1)},{id: id})
      end
    end
    render nothing: true
  end

end
