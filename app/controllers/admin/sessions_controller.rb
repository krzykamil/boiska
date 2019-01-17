module Admin
  class SessionsController < ApplicationController
    def new; end

    def create
      if user && user.authenticate(session_params[:password])
        session[:user_id] = user.id
        redirect_to admin_users_path

      else
        render :new
      end
    end

    def show; end

    private

    def user
      @user ||= User.find_by(email: session_params[:email])
    end

    def session_params
      params.require(:session).permit(:email, :password)
    end
  end
end
