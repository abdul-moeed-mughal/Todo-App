class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    p params['user']['name']
    @user.name = params['user']['name']
    @user.email = params['user']['email']
    @user.mobile_number = params['user']['mobile_number']
    @user.dob = params['user']['dob']
    respond_to do |format|
      if @user.save
        format.html {redirect_to user_path(@user.id), notice: "User was successfully updated."}
        format.json {render :show, status: :ok, location: @episode}
      else
        format.html{render :edit}
        format.json{render json: @user.errors}
      end
    end

  end

  def show
    @user = User.find(params[:id])

  end
end
