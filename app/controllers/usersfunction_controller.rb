class UsersfunctionController < ApplicationController
  def index
    @users = User.order(id: :desc).all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: 'user created!'
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: 'user deleted!'
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end