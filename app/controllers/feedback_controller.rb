class FeedbackController < ApplicationController
  def new
  end

  def create
    text = params[:text]
    FeedbackMailer.feedback(current_user, text).deliver_now
    redirect_to root_path
  end
end
