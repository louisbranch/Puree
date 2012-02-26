class PomodorosController < ApplicationController

  def create
    Pomodoro.mass_create(params[:task][:id], params[:task][:pomodoros].to_i)
    render nothing: true
  end

  def updated

  end

end
