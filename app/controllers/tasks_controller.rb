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
      redirect_to tasks_path(params["tasks"]["user_id"])
    else
      render "new"
    end
  end

  def show
    get_user
    get_task
  end

  def edit
    get_user
    get_task
  end

  def update
    get_user
    get_task

    @task.name = params["tasks"]["name"]
    @task.description = params["tasks"]["description"]

    if @task.save
      redirect_to tasks_path(@user.id)
    else
      render "edit"
    end
  end

  def destroy
    get_user
    get_task

    @task.destroy

    redirect_to tasks_path(@user.id)
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
