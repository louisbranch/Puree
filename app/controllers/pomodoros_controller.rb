class PomodorosController < ApplicationController

  def create
    task = Task.find(params[:task_id])
    task.update_attributes(params[:task])
    render nothing: true
  end

end
