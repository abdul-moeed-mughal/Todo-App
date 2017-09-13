class StatusesController < ApplicationController
  before_filter :find_status, only: [:show,:edit,:update,:destroy]
  before_filter :require_admin_login

  def index
    @statuses = Status.all
  end

  def new
    @status = Status.new
  end

  def edit
  end

  def create
    @status = Status.new
    @status.name = params['status']['name']
    @status.is_closed = params['status']['is_closed']
    respond_to do |format|
      if @status.save
        format.html {redirect_to status_path(@status.id), notice: "Status was successfully created."}
        format.json {render :show, status: :ok, location: @status}
      else
        format.html{render :new}
        format.json{render json: @status.errors}
      end
    end
  end

  def show
  end

  def update
    @status.name = params['status']['name']
    @status.is_closed = params['status']['is_closed']
    respond_to do |format|
      if @status.save
        format.html {redirect_to status_path(@status.id), notice: "Status was successfully updated."}
        format.json {render :show, status: :ok, location: @status}
      else
        format.html{render :edit}
        format.json{render json: @status.errors}
      end
    end
  end

  def destroy
    @status.destroy
    redirect_to statuses_path, :flash => { :success => "Status deleted successfully. " }
  end
end


private

def find_status
  @status = Status.find(params[:id])
end
