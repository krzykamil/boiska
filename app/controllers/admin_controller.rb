class AdminController < ApplicationController
  include Pagy::Backend
  before_action :authorize
  def authorize
    redirect_to new_session_path, alert: 'not authorize' if current_user.nil?
  end
end
