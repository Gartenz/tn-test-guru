class SessionsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :set_request_path

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:request_path]
    else
      flash[:alert] = "Something wrong! Please check your email or passsowrd"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    logout!
  end
end
