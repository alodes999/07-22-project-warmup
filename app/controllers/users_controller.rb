class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def new
    @users = User.new
  end
  
  def create
    @users = User.new(params_hash)
    
    if @users.save
      redirect_to "/users"
    else
      render "new"
    end
  end
  
  def show
    get_user
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
    params["users"].permit(:email, :password)
  end
  
  def get_user
    @user = User.find(params[:id])
  end
end