class TasksController < ApplicationController

  def index
    get_user
    @tasks = Task.where(user_id: @user.id)
  end

  def new
    get_user
    @task = Task.new
  end

  def create
    @task = Task.new(params_hash)
    if @task.save
      redirect_to "/users/#{params["tasks"]["user_id"]}/tasks"
    else
      render "/users/#{params["tasks"]["user_id"]}/tasks/new"
    end
  end

  def show
    get_user
    get_task
  end

  def edit
    get_user
  end

  def update
    get_user

    @user.email = params["users"]["email"]
    @user.password = params["users"]["password"]

    if @user.save
      redirect_to "/users"
    else
      render "edit"
    end
  end

  def destroy
    get_user

    @user.destroy

    redirect_to "/users"
  end


  private

  def params_hash
    params["tasks"].permit(:name, :description, :user_id)
  end

  def get_user
    @user = User.find(params[:user_id])
  end

  def get_task
    @task = Task.find(params[:id])
  end
end
