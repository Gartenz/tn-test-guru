class ApplicationController < ActionController::Base
  before_action :set_request_path
  before_action :authenticate_user!
  helper_method :current_user,
                :logged_in?

  private

  def authenticate_user!
    redirect_to login_path unless current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    @current_user.present?
  end

  def set_request_path
    session[:request_path] = request.path
  end

  def logout!
    @current_user = nil;
    redirect_to root_path
  end

end
