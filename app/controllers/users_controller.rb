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
  
  
  
  
  
  private
  
  def params_hash
    params["users"].permit(:email, :password)
  end
end