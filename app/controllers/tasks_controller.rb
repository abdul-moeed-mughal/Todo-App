class TasksController < ApplicationController

  before_filter :find_task, only: [:show,:edit,:update,:destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def update

  end

  def show

  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end
end

private

def find_task
  @task = Task.find(params[:id])
end
