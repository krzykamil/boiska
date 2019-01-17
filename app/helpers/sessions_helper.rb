module SessionsHelper
  # Logs in the goven user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Return the current logged-in user (if any).

  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
