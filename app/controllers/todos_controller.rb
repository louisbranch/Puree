class TodosController < ApplicationController

  def create
    Todo.create
    redirect_to root_path
  end

end
