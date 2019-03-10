class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_record_not_found

  def index
    render json: { questions: @test.questions }
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @test = Test.find(params[:test_id])
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    test = Test.find(params[:test_id])
    question = test.questions.new(question_params)
    if question.save
      redirect_to test_path(test)
    else
      render :new
    end
  end

  def update
    question = Question.find(params[:id])
    if question.update(question_params)
      redirect_to test_path(question.test_id)
    else
      render :edit
    end
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to test_path(question.test_id)
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_record_not_found
    head :not_found
    render plain: "Record not found!"
  end

end
