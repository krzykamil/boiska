module Admin
  class UsersController < AdminController

    def show
      @user = User.find(params[:id])
    end

    def new
      @user = User.new
    end

    def edit
      @user = User.find(params[:id])
    end

    def index
      @pagy, @users =  pagy(User.all)
    end

    def create
      @user = User.new(sign_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to admin_user_path(@user)
      else
        flash[:error] = "Invalid something"
        render new_admin_user_path
      end
    end

    def destroy
      @user = User.find(params[:id])
      redirect_to admin_users_path(@user) if @user.destroy
    end

    def update
      @user = User.find(params[:id])
      if @user.update(sign_params)
        redirect_to admin_user_path(@user)
      else
        flash[:notice] = "Update Failed"
        render 'edit'
      end
    end

    private

    def sign_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone)
    end
  end
end
