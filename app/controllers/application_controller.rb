class ApplicationController < ActionController::Base
  before_action :set_request_path

  private

  def set_request_path
    session[:request_path] = request.path
  end

end
