class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.create(user_params)

    if @user.save
      redirect_to @user
    else
      render 'new'
    end

  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end

    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :avatar)
    end
end
