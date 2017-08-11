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

  def create
    @task = Task.new
    @task.status_id = params['task']['status']
    @task.subject = params['task']['subject']
    @task.description = params['task']['description']
    @task.assigned_to_id = params['task']['assigned_to_id']
    @task.author_id = current_user.id
    @task.start_date = params['task']['start_date']
    @task.end_date = params['task']['end_date']
    respond_to do |format|
      if @task.save
        format.html {redirect_to task_path(@task.id),notice: "Task was successfully created."}
        format.json {render :show,status: :ok,location: @task}
      else
        format.html{render :new}
        format.json{render json: @user.errors}
      end
    end
  end

  def update
    @task.status_id = params['task']['status']
    @task.subject = params['task']['subject']
    @task.description = params['task']['description']
    @task.assigned_to_id = params['task']['assigned_to_id']
    @task.start_date = params['task']['start_date']
    @task.end_date = params['task']['end_date']
    respond_to do |format|
      if @task.save
        p @task
        format.html {redirect_to task_path(@task.id),notice: "Task was successfully created."}
        format.json {render :show,status: :ok,location: @task}
      else
        format.html{render :edit}
        format.json{render json: @user.errors}
      end
    end
  end

  def show

  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def bulk_update
    if params['ids'].present? && params['assignee'].present?
      tasks = Task.where(:id => params["ids"]).update_all(:assigned_to_id =>  params['assignee'].to_i)
    end
    respond_to do |format|
      flash[:notice] = 'Successfully  Updated.'
      format.html { redirect_to tasks_path }
    end
  end
end

private

def find_task
  @task = Task.find(params[:id])
end
