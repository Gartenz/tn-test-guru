class Admin::TestsController < Admin::BaseController
  before_action :set_tests, only: %i[index update_inline]
  before_action :set_test, only: %i[show edit update destroy start update_inline publish]

  def index
  end

  def new
    @test = current_user.created_tests.new
  end

  def show
  end

  def edit
  end

  def create
    @test = current_user.created_tests.new(tests_params)
    if @test.save
      redirect_to admin_tests_path
    else
      render :new
    end
  end

  def update
    if @test.update(tests_params)
      redirect_to [:admin, @test]
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(tests_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  def publish
    if publishable?(@test)
      if @test.update(published: true)
        flash[:success] = 'Test was published'
        redirect_to admin_tests_path
      end
    else
      flash[:danger] = 'There was error while tryng to publish test. check your questions or answers'
      render :show
    end
  end

  private

  def publishable?(test)
    return false unless test.questions.count > 0
    test.questions.each do |q|
      return false if q.answers.correct.count == 0 || q.answers.count == 0
    end
  end

  def set_tests
    @tests = Test.all
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def tests_params
    params.require(:test).permit(:title, :category_id, :level, :test_minutes)
  end
end
