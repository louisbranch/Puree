class TodosController < ApplicationController

  respond_to :html, :js

  def create
    @todo = Todo.create
    respond_with @todo, :location => root_path
  end

end
