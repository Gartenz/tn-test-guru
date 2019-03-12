class TestsController < ApplicationController
  before_action :set_test, only: %i[show edit update destroy start]
  before_action :set_user, only: :start
  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def show
  end

  def edit
  end

  def create
    if @test.save
      redirect_to tests_path
    else
      render :new
    end
  end

  def update
    if @test.update(tests_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def set_user
    @user = User.first
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def tests_params
    params.require(:test).permit(:title, :category_id, :level)
  end
end
