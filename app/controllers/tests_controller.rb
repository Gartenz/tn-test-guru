class TestsController < ApplicationController
  before_action :set_test, only: %i[start]

  def index
    @tests = Test.all
  end

  def start
    if @test.questions.count > 0
      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test)
    else
      flash[:warning] = 'Cannot choose empty test'
      redirect_to tests_path
    end
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end
