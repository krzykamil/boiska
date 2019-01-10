module Admin
  class UsersController < ApplicationController
    def show
      @user = User.find(params[:id])
    end

    def new
      @user = User.new
    end

    def index; end

    def create
      @user = User.new(sign_params)
      if @user.save
        log_in @user
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
end
