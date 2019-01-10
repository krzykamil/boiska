class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_params)
    if @user.before_save
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def sign_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
