class TestsMailer < ApplicationMailer

  def completed_test(test_passage)
    @user = test_passage.user
    @test = test_passage.test

    mail from: from:ENV['ADMIN_MAIL'], to: @user.email, subject: 'You just comleted the TestGuru test!'
  end
end
