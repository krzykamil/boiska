class AdminController < ApplicationController
  before_action :permision
  def permision
    redirect_to new_session_path, alert: 'not authorize' if current_user.nil?
  end
end
