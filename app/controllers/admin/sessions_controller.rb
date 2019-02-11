module Admin
  class SessionsController < ApplicationController

    protect_from_forgery with: :exception
    def new; end

    def create
      if user && user.authenticate(session_params[:password])

        session[:user_id] = user.id
        redirect_to admin_users_path

      else
        flash.now[:alert] = 'Email or password is invalid'
        render :new
      end
    end

    def index; end

    def show; end

    def destroy
      session[:user_id] = nil
      reset_session
      redirect_to new_session_path
    end

    private

    def user
      @user ||= User.find_by(email: session_params[:email])
    end

    def session_params
      params.require(:session).permit(:email, :password)
    end
  end
end
