class FeedbackMailer < ApplicationMailer

  def feedback(user,text)
    @user = user
    @text = text
    # byebug
    mail from: user.email , to: ENV['ADMIN_MAIL'], subject: 'You recieved a feedback from user'
  end
end
