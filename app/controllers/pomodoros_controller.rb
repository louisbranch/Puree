class PomodorosController < ApplicationController

  respond_to :html, :js

  def create
    @task = params[:task][:id]
    Pomodoro.mass_create(@task, params[:task][:pomodoros].to_i)
    respond_with(@task, :location => root_path)
  end

  def update
    pomodoro = Pomodoro.find(params[:id])
    pomodoro.start
    @task = pomodoro.task_id
    respond_with(@task, :location => root_path)
  end

end
