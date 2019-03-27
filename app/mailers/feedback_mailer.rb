class FeedbackMailer < ApplicationMailer

  def feedback(user,text)
    @user = user
    @text = text
    # byebug
    mail from:ENV['ADMIN_MAIL'], to: ENV['ADMIN_MAIL'], subject: 'You recieved a feedback from user'
  end
end
