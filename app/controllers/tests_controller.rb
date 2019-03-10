class TestsController < ApplicationController
  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def show
    @test = Test.find(params[:id])
  end

  def edit
    @test = Test.find(params[:id])
  end

  def create
    @test = Test.new(tests_params)
    if @test.save
      redirect_to tests_path
    else
      render :new
    end
  end

  def update
    test = Test.find(params[:id])
    if test.update(tests_params)
      redirect_to test
    else
      render :edit
    end
  end

  def destroy
    test = Test.find(params[:id])
    test.destroy
    redirect_to tests_path
  end

  def tests_params
    params.require(:test).permit(:title, :category_id, :level)
  end
end
