class UsersController < ApplicationController

  def login
  end

  def authenticate_login
    entered_email = params["users"]["email"]
    @user_email = User.find_by(email: entered_email)

    if !@user_email.nil?
      @valid = true
      given_pw = params["users"]["password"]
      actual_pw = BCrypt::Password.new(@user_email.password)
        
      if actual_pw == given_pw
        session[:user_id] = @user_email.id
        redirect_to tasks_path(@user_email.id)
      else
        @valid = false
        render login_path
      end
    else
      @valid = false
      render login_path
    end
  end

  def index
    @users = User.all
  end

  def new
    @users = User.new
  end

  def create
    enc_pw = BCrypt::Password.create(params["users"]["password"])
    @users = User.new({"email" => params["users"]["email"], "password" => enc_pw})

    if @users.save
      redirect_to users_path
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
      redirect_to users_path
    else
      render "edit"
    end
  end

  def destroy
    get_user

    @user.destroy

    redirect_to users_path
  end


  private

  def params_hash
    params["users"].permit(:email, :password)
  end

  def get_user
    @user = User.find(params[:id])
  end
end
